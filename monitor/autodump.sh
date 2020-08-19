export pktname

interface=ens3
dumpdir=/home/ubuntu/dumps

while /bin/true; do
  pkt_old=`grep $interface: /proc/net/dev | cut -d :  -f2 | awk '{ print $2 }'`
  sleep 1
  pkt_new=`grep $interface: /proc/net/dev | cut -d :  -f2 | awk '{ print $2 }'`

  pkt=$(( $pkt_new - $pkt_old ))
  echo -ne "\r$pkt packets/s\033[0K"

  if [ $pkt -gt 1 ]; then
    echo -e "\n`date` Under Attack. Capturing..."
    pktname="dump_`date +%d-%m-%y_%H:%M:%S`.pcap"
    tcpdump -i $interface -t -w $dumpdir/dump_`date +%d-%m-%y_%H:%M:%S`.pcap -c 10000
    echo "`date` Packets Captured. Sleeping..."
python3 webhook.py
  sleep 1800
python3 webhook2.py
  fi
done