hostnamectl | grep "Operating System" | sed 's/Operating System: //' | sed -e 's/[ \t]*//'  
hostnamectl | grep Kernel | sed 's/Kernel: //' | sed -e 's/[ \t]*//'  
hostnamectl | grep Architecture | sed 's/Architecture: //' | sed -e 's/[ \t]*//'  

cat /proc/cpuinfo | grep "physical id" | sort | uniq | wc -l  
cat /proc/cpuinfo | grep processor | wc -l  

free -m | grep Mem | awk '{printf("%d/%dMB (%.2f%%)\n", $3, $2, $3/$2 * 100.0}'  
df -h / | awk 'NR==2{printf("%s/%s (%d%%)\n", $3, $2, $5)}'  

`cat /proc/stat | awk '{printf("%.1f%%\n", ($2+$4)*100.0/($2+$4+$5))}' | head -1`  

who -b | sed -e 's/system boot//' | sed -e 's/[ \t]*//'  

LVM=$( cat /etc/fstab | grep "/dev/mapper" | wc -l )  
if [ $LVM -gt 0 ]  
then  
echo "#LVM use: yes"  
else  
echo "#LVM use: no"  
fi  

netstat -ant | grep ESTABLISHED | wc -l

who | uniq | wc -l  

apt-get install net-tools  
hostname -I` "("`ip address | grep "link/ether" | grep -ioE '([a-z0-9]{2}:){5}..' | head -1`")"  

`journalctl _COMM=sudo | grep COMMAND | uniq | wc -l`" cmd"  