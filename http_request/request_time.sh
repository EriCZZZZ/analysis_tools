#!/bin/sh

# init vars
data=""
url=""

while getopts 'd:s:' OPT; do
    case $OPT in
        d) data=$OPTARG;;
        s) url=$OPTARG;;
    esac
done

echo $data
echo $url

# do curl
curl -w "%{time_namelookup}\n" \
-d "$data" \
-o /dev/null \
-s "$url"
