#!/bin/bash
#
# Behold! 5 Lines of bash doing the same half million lines of Go in Slack
read -p "Enter Channel Name: " CHANNEL
echo "export channel=$CHANNEL" >> ~/.bashrc

while /usr/bin/true
do
	read -p "Chat: " line || exit 0 # EOF
	/usr/bin/echo "$(/usr/bin/date --iso-8601=seconds)" "$(printf "%-9s" "$(/usr/bin/id --user --name --real)")" "$line" >> /var/lib/suc/"$CHANNEL"
	clear

done
