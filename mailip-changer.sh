#!/bin/bash
DOSYA="/etc/mailips"
IP="$1"
KONTROL=$(lsattr /etc/mailips | grep "i-" | wc -l)

if [[ $# -eq 0 ]] ; then
	echo "IP Adresi giriniz"
	echo "Ornek:"
	echo "bash mailip_changer.sh 192.168.0.2"
	exit 1
fi

if [[ ! $KONTROL -eq 1 ]]; then
	echo ""
	echo "*: $IP" > $DOSYA
	echo "Mail IP adresi $IP olarak degistirildi"
	echo "Asagidaki kodu crontab -e ile ekleyin"
	echo "0 * * * * /bin/bash mailip-changer.sh $IP > /dev/null 2>&1"
	echo ""
else
	echo ""
	echo "$DOSYA yazilabilir degil"
	lsattr $DOSYA
	echo ""
fi
