#Variables go here
myzip="San Francisco"
wifi=$(iwgetid -r)
pending=$(task status:pending count)
btcprice=$(curl -s https://btc-e.com/api/2/btc_usd/ticker | json_pp | grep last | cut -d : -f 2 | tr -d ,| tr -d " ")

#Overview
echo -en "\033[47m\e[1;30m"
echo "Today is $(date)"
echo -en "\e[0m\e[0m"
echo -e "Weather:  "
. /home/bk/.scripts/ansiweather/ansiweather -l "$myzip"

echo -e "Connected to \033[42m$wifi\e[0m "
echo -en "Bitcoin Exchange rate is \033[43m\e[1;33m\$"
echo -e "$btcprice\e[0m"
echo "Network Info"
echo -en "External IP	: \e[31m\e[1m"
curl http://ipecho.net/plain; echo
echo -ne "\e[0m"
echo -en "Local IP	: \e[31m\e[1m"
ifconfig | grep -A3 wlan0 | grep "inet " | sed -e 's/^[[:space:]]*//' | cut -d " " -f2 | cut -d : -f2
echo -ne "\e[0m"
#echo -e "The current world population is \e[34m\e[1m$(curl -s http://www.census.gov/popclock/data/population/world | tr , "\n" | grep World -A 5 | grep \"population\" | tr : "\n" | tail -1)\e[0m\e[0m"
echo "You have $pending tasks to do."



#Start output
echo -e "------"
echo "The Forecast at $myzip"
sh /home/bk/.scripts/ansiweather/ansiweather -F -l "$myzip"
echo "------"
echo "------"
echo -en "\e[31m\e[1mTasks due\e[0m"
task list

