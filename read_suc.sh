#!/bin/bash
# Follow suc chat
#
suc_channel=/var/lib/suc
read -p "Channel name: "
tail -f $suc_channel/"$REPLY"

