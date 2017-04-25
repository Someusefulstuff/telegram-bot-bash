#!/bin/bash

TOKEN=''
URL='https://api.telegram.org/bot'$TOKEN
MSG_URL=$URL'/sendMessage?chat_id='
UPD_URL=$URL'/getUpdates?offset='
OFFSET=0
TIMEOUT='&timeout=30'

function send_message {
	res=$(curl --insecure --data-urlencode "text=$2" "$MSG_URL$1&")
}

while true; do {
	res=$(curl --insecure $UPD_URL$OFFSET$TIMEOUT)

	TARGET=$(echo $res | JSON.sh | egrep '\["result",0,"message","chat","id"\]' | cut -f 2)
	OFFSET=$(echo $res | JSON.sh | egrep '\["result",0,"update_id"\]' | cut -f 2)
	MESSAGE=$(echo $res | JSON.sh -s | egrep '\["result",0,"message","text"\]' | cut -f 2 | cut -d '"' -f 2)
	USER=$(echo $res | JSON.sh | egrep '\["result",0,"message","from","username"\]' | cut -f 2 | cut -d '"' -f 2)

	[ -z "$MESSAGE" ] || echo "[$(date +%Y.%m.%d_%H:%M:%S)][$USER] $MESSAGE" >> /var/log/bashbot.log

	OFFSET=$((OFFSET+1))

	if [ $OFFSET != 1 ]; then
		case $MESSAGE in
			'/start') msg="Just few commands are implemented. Blame @ryzhov_al if something goes wrong.";;
			'/top') msg="$(top -n1 | head -n3)";;
			'/meminfo') msg="$(cat /proc/meminfo)";;
			'/cpuinfo') msg="$(cat /proc/cpuinfo)";;
			'/uname') msg="$(uname -a)";;
			'/log') msg="$(cat /var/log/bashbot.log)";;
			'/test') msg="(echo 'test'";;
			*) msg="$MESSAGE";;

		esac
		send_message "$TARGET" "$msg"
	fi

} &>/dev/null; done
