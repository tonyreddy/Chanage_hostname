#!/bin/sh
echo "Enter User password ::"$cond2
read cond2
if [  -z "$cond2" ]
then
echo Your password file configuration successfully skiped..................
else
echo "$cond2" > pas.txt
echo Your password file configuration successfully finced..................
fi
echo '#!/bin/sh' > st.sh
echo 'b=$(hostname)' >> st.sh
echo 'c=$(ifconfig eth0 | grep "inet addr" | cut -d':' -f2 | cut -d' ' -f1 )' >> st.sh
echo 'echo $c $b > 1' >> st.sh
chmod +x st.sh
cat pas.txt | sudo -S mv st.sh /opt/
cat pas.txt | sudo -S cp /var/spool/cron/crontabs/root .
cat pas.txt | sudo -S chown $a root
echo '@reboot /opt/st.sh' >> root
cat pas.txt | sudo -S chown root root
cat pas.txt | sudo -S chmod 0600 root
cat pas.txt | sudo -S mv root /var/spool/cron/crontabs/root
