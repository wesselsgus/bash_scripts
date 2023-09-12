#!/bin/bash
#
#
#
quit="no"

option1 () {
echo ""
echo "Connecting to Afrihost on 12668"
~/kustomers/afrihost.sh
}

option2 () {
echo ""
echo "Connecting to Econet-zim on 12398"
~/kustomers/econet_zim.sh
}

option3 () {
echo ""
echo "Connecting to Econet-les on 11135"
~/kustomers/econet_les.sh
}


option4 () {
echo ""
echo "Connecting iOnline on 12726"
~/kustomers/iOnline.sh
}


option5 () {
echo ""
echo "Connecting to FirstNet on 12384"
~/kustomers/firstnet.sh
}

option6 () {
echo ""
echo "Connecting to Paratus on 12390"
~/kustomers/paratus.sh
}


option7 () {
echo ""
echo "Connecting to RCS on 12220"
~/kustomers/rcs.sh
}

option8 () {


echo "Connecting to Vodacom-les on 11103"
~/kustomers/vodacom_les.sh
}

option9 () {
echo "Quit"

}

while [ $quit != "yes" ]
do
echo ""
echo "Customers"
echo "%%%%%%%%%"
echo "1. Afrihost 12668"
echo "2. econet-zim 12398"
echo "3. econet-les 11135"
echo "4. iOnline 12726"
echo "5. FirstNet 12384"
echo "6. Paratus 12390"
echo "7. RCS 12220"
echo "8. Vodacom-les 11103"
echo "q. Quit"
echo -n "Select an option : "
read options

case $options in
1) option1 ;;
2) option2 ;;
3) option3 ;;
4) option4 ;;
5) option5 ;;
6) option6 ;;
7) option7 ;;
8) option8 ;;
q) quit="yes" ;;
*) echo "\"$options\" is not valid"
sleep 1 ;;
esac
done