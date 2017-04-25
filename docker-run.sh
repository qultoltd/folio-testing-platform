#!/bin/bash

set -e
#set -x

url=$(wget -q -O - --tries=1 --connect-timeout=5 --read-timeout=15 'http://folio-uidemo.aws.indexdata.com/bundle.js'|grep :9130| perl -ne 'print "$1\n" if m|url:(.*?),|')
perl -i.bak -npe "s,url':'(.*?)',url':$url," stripes.config.js 

STRIPES_HOST=0.0.0.0 yarn start
