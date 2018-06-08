#!/bin/sh

# init vars
OPTIND=1
usage="usage: $0 -b <cookies_string/cookies_file> -d curl_d -s curl_s\n"
cookies=""
data=""
url=""
format="\
状态码		%{http_code}\n\
-----		-----\n\
DNS解析		%{time_namelookup}s\n\
连接完成	%{time_appconnect}s\n\
重定向完成	%{time_redirect}s\n\
开始传输	%{time_starttransfer}s\n\
-----		-----\n\
总时间		%{time_total}s\n\
"

while getopts bd:s: OPT; do
    case $OPT in
	b)
		cookies=$OPTARG
		;;
        d) 
		data=$OPTARG
		;;
        s) 
		url=$OPTARG
		;;
	:)
		echo $usage
		exit 1
		;;
	?)
		echo $usage
		exit 1
		;;
    esac
done

# do curl
curl -w "${format}\n" \
-b "$cookies" \
-d "$data" \
-o /dev/null \
-s "$url"
