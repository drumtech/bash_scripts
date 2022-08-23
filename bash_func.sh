#!/bin/bash
### Before you begin make archive from etc for example 'tar cvf etc.tar.gz /etc/'
### Function will extract archive passed as an argument 1, then will find recursively argument 2 inside unziped directory
### Construction ${1%.*.*} will cut tar.gz from argument 1
zzgrep () {
    tar -xvf $1 > /dev/null
    grep -r $2 ${1%.*.*}
}

zzgrep etc.tar.gz passwd
