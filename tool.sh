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

PING_COUNT=2

# Функція для перевірки хоста
check_host() {
	local ip=$1
	if ping -c $PING_COUNT $ip >/dev/null 2>&1; then
		echo "Хост $ip - ONLINE"
		return 0
	else
		echo "Хост $ip - OFFLINE"
		return 1
	fi
}

# Головний цикл перевірки
echo "Початок перевірки хостів..."
for ip in "${IP_LIST[@]}"; do
	check_host "$ip"
done

echo "Перевірка завершена."
