#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/ssnvpn/theme/color.conf)
AKUN="AKUN VMESS"
TIMES="10"
CHATIDGC="702916090"
KEY="6782550545:AAEQJCiVZvTvu-2vvd5z4I4I4V7-W3lwIyM"
URL="https://api.telegram.org/bot$KEY/sendMessage"
colornow=$(cat /etc/ssnvpn/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m" 
COLOR1="\033[1;36m"
COLBG1="\e[1;97;101m"                      
###########- END COLOR CODE -##########        
# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'

function cektrojan(){
clear
echo -n > /tmp/other.txt
data=( `cat /etc/xray/config.json | grep '^#!' | cut -d ' ' -f 2 | sort | uniq`);
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}          • TROJAN ONLINE NOW •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi

echo -n > /tmp/iptrojan.txt
data2=( `cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`);
for ip in "${data2[@]}"
do

jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/iptrojan.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/iptrojan.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done

jum=$(cat /tmp/iptrojan.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/iptrojan.txt | nl)
echo -e "   user : $akun";
echo -e "   $jum2";
fi
rm -rf /tmp/iptrojan.txt
done

rm -rf /tmp/other.txt
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-trojan
}


function deltrojan(){
    clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#! " "/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}         • DELETE TROJAN USER •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "  • You Dont have any existing clients!"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-trojan
fi
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}         • DELETE TROJAN USER •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
echo -e ""
echo -e "  • [NOTE] Press any key to back on menu"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -rp "   Input Username : " user
if [ -z $user ]; then
menu-trojan
else
exp=$(grep -wE "^#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
sed -i "/^#! $user $exp/,/^},{/d" /etc/xray/config.json
systemctl restart xray > /dev/null 2>&1
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}         • DELETE TROJAN USER •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "   • Accound Delete Successfully"
echo -e ""
echo -e "   • Client Name : $user"
echo -e "   • Expired On  : $exp"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-trojan
fi
}

function renewtrojan(){
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}          • RENEW TROJAN USER •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
NUMBER_OF_CLIENTS=$(grep -c -E "^#! " "/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "  • You have no existing clients!"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-trojan
fi
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}          • RENEW TROJAN USER •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
grep -E "^#! " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq | nl
echo -e ""
echo -e "  • [NOTE] Press any key to back on menu"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -rp "   Input Username : " user
if [ -z $user ]; then
menu-trojan
else
read -p "   Expired (days): " masaaktif
if [ -z $masaaktif ]; then
masaaktif="1"
fi
exp=$(grep -E "^#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "/#! $user/c\#! $user $exp4" /etc/xray/config.json
systemctl restart xray > /dev/null 2>&1
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}          • RENEW TROJAN USER •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "   [INFO]  $user Account Renewed Successfully"
echo -e "   "
echo -e "   Client Name : $user"
echo -e "   Days Added  : $masaaktif Days"
echo -e "   Expired On  : $exp4"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-trojan
fi
}

function addtrojan(){
source /var/lib/ssnvpn-pro/ipvps.conf
domain=$(cat /etc/xray/domain)
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}         • CREATE TROJAN USER •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
tr="$(cat ~/log-install.txt | grep -w "Trojan WS " | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "   Input Username : " -e user
read -p "   Nama Buyer     : " OWNER
CHATIDGC="702916090"
if [ -z $user ]; then
echo -e "   [Error] Username cannot be empty "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu
fi
user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)
if [[ ${user_EXISTS} == '1' ]]; then
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}         • CREATE TROJAN USER •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "  Please choose another name."
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -n 1 -s -r -p "   Press any key to back on menu"
trojan-menu
fi
done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p " Limit User Quota " Quota
read -p " Limit User ip " limit
read -p " Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:${tr}?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"
trojanlink="trojan://${uuid}@bug.com:${tr}?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
TIMES="1"
CHATIDGC="6782550545:AAEQJCiVZvTvu-2vvd5z4I4I4V7-W3lwIyM"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TRX="
<code>INFO MASKU -Transaksi</code>
<code>────────────────────</code>
<b>  ⚠️TRANSAKSI AKUN TROJAN⚠️      </b>
<code>────────────────────</code>
<code>🌟Owner   : $OWNER</code>
<code>🌟Member  : $user</code>
<code>🌟Detail  : $AKUN</code>
<code>🌟Durasi  : $exp</code>
<code>🌟Server  : $domain</code>
<code>⚠️SELAMAT MENIKMATI⚠️</code>
<code>⚠️Script By Andyyuda⚠️</code>
<code>────────────────────</code>
<i>Notifikasi Via D_swara-BOT</i>
<b>Tele : @Andyyuda</b>
"
curl -s --max-time $TIMES -d "chat_id=$CHATIDGC&disable_web_page_preview=1&text=$TRX&parse_mode=html" $URL
clear
END
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " ${COLBG1}         • CREATE TROJAN USER •         ${NC} "
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$COLOR1 ${NC} Remarks     : ${user}" 
echo -e "$COLOR1 ${NC} Expired On  : $exp" 
echo -e "$COLOR1 ${NC} User Quota    : ${Quota} GB" 
echo -e "$COLOR1 ${NC} Limit IP      : ${limit} User" 
echo -e "$COLOR1 ${NC} Host/IP     : ${domain}" 
echo -e "$COLOR1 ${NC} Port        : ${tr}" 
echo -e "$COLOR1 ${NC} Key         : ${uuid}" 
echo -e "$COLOR1 ${NC} Path        : /trojan-ws"
echo -e "$COLOR1 ${NC} Path WSS    : wss://bug.com/trojan-ws" 
echo -e "$COLOR1 ${NC} ServiceName : trojan-grpc" 
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$COLOR1 ${NC} Link WS : "
echo -e "$COLOR1 ${NC} ${trojanlink}" 
echo -e "$COLOR1 ${NC} "
echo -e "$COLOR1 ${NC} Link GRPC : "
echo -e "$COLOR1 ${NC} ${trojanlink1}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "" 
###VTURBOTTRANSAKSINEXUPDATE
read -n 1 -s -r -p "   Press any key to back on menu"
menu-trojan
}
function trialtrojan(){
source /var/lib/ssnvpn-pro/ipvps.conf
domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "Trojan WS " | cut -d: -f2|sed 's/ //g')"
ntls="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:${tls}?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@isi_bug_disini:${tls}?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink2="trojan://${uuid}@isi_bug_disini:${ntls}?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws#${user}"
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;41;36m           TRIAL TROJAN           \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Remarks        : ${user}"
echo -e "Host/IP        : ${domain}"
echo -e "Port TLS       : ${tls}"
echo -e "Port none TLS  : ${ntls}"
echo -e "Port gRPC      : ${tls}"
echo -e "Key            : ${uuid}"
echo -e "Path           : /trojan-ws"
echo -e "ServiceName    : trojan-grpc"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link TLS       : ${trojanlink}"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link none TLS  : ${trojanlink2}"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link gRPC      : ${trojanlink1}"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Expired On     : $exp"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu-trojan
}

clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m           MENU MANAGER TROJAN          \E[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;93m〔⎆〕 ${grenbo}1.${NC} \033[0;36mCreating a Trojan Account${NC}"
echo -e "\033[1;93m〔⎆〕 ${grenbo}2.${NC} \033[0;36mTrial  Trojan Account${NC}"
echo -e "\033[1;93m〔⎆〕 ${grenbo}3.${NC} \033[0;36mRenew a Trojan Account${NC}"
echo -e "\033[1;93m〔⎆〕 ${grenbo}4.${NC} \033[0;36mDelete a Trojan Account${NC}"
echo -e "\033[1;93m〔⎆〕 ${grenbo}5.${NC} \033[0;36mCek Login Trojan Account${NC}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
01 | 1) clear ; addtrojan ;;
02 | 2) clear ; trialtrojan ;;
03 | 3) clear ; renewtrojan ;;
04 | 4) clear ; deltrojan ;;
05 | 5) clear ; cektrojan ;;
00 | 0) clear ; menu ;;
*) clear ; menu-trojan ;;
esac

       
