IP_LIST=(
	"192.168.0.1"
	"192.168.1.1"
	"192.168.2.1"
	"192.168.10.1"
	"192.168.31.1"
	"192.168.100.1"
	"10.0.0.1"
	"10.0.1.1"
)

YELLOW='\e[33m'
GREEN='\e[32m'
RED='\e[31m'
NC='\e[0m'

PING_COUNT=1

clear
echo -e "${YELLOW}"
figlet IpSearch

echo "++++++++++++++++++++++++++++++++++++++++++++++++++"

echo " "

echo "App using base ip pool by the creator of program. Author - TheDmitryY"
# Функція для перевірки хоста

echo " "

check_host() {
	local ip=$1
	if ping -c $PING_COUNT $ip >/dev/null 2>&1; then
		echo -e "Хост $ip - ${GREEN}ONLINE ${NC}"
		echo -e "${YELLOW}"
		return 0
	else
		echo -e "Хост $ip - ${RED}OFFLINE ${NC}"
		echo -e "${YELLOW}"
		return 1
	fi
}

# Головний цикл перевірки
echo "Початок перевірки хостів..."
echo " "
for ip in "${IP_LIST[@]}"; do
	check_host "$ip"
done

echo "Перевірка завершена."
echo -e "${NC}"
