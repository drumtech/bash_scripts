#!/bin/bash
NAME=$(ls /home/user/repo/secure/bots)
for i in $NAME
do
### Extract when the password was changed
TIME=$(ldapsearch -v -x -D "bot-for-ldap@example.com" -w "verysecretpassword" -b "OU=L1,OU=Services,OU=SpecialUsers,DC=example,DC=com" -H "ldaps://my_super_duperLdap_server-666.example.com" sAMAccountName=$i 2>/dev/null | grep "pwdLastSet:")

### Check that the field is not empty
if [[ -z $TIME ]]
then
	echo $i 'the bot is not in the AD'
	continue
else
### Exctract second field, value itself
	D=$(echo $TIME | awk '{print $2}')
### Divide by 10’000’000 pwdLastSet to convert in seconds and substract 11’644’473’600 (this is the difference in second between the 1 January 1601 and 1970)
	WHEN_WAS_CHANGED=`echo $((($D/10000000)-11644473600))`
### 1 years equals 31536000 seconds
	WHEN_NEED_TO_CHANGE=$(( 31536000+$WHEN_WAS_CHANGED ))
	TIME_NOW=$(date +%s)
	WHEN_SEND_NOTIFICATION=$(( $WHEN_NEED_TO_CHANGE-$TIME_NOW ))
###14 days equals 1209600 seconds
	if [[ $WHEN_SEND_NOTIFICATION -le 1209600 ]];then
		GOOD=$(echo "You need to change password for" $i)
		JSON="{\"context\": \"http://schema.org/extensions\", \"type\": \"MessageCard\", \"text\": \"${GOOD}\"}"
### This string take from MS Teams
		curl -H 'Content-Type: application/json' -d "$JSON" https://example.webhook.office.com/webhookb2/80976213498673-12312312-2134dvdcv-422314scadv-234332424dsvdf-sdv213443/IncomingWebhook/328764386dfvjkshbcwekut346t37824/12938dsvcsv-1234986dfvd-sdvsd9786
	fi
fi

done
