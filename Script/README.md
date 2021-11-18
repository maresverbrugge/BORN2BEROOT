# Script

## Subject
> Finally, you have to create a simple script called `monitoring.sh`. It must be developed in `bash`.  
> At server startup, the script will display some information (listed below) on all terminals every 10 minutes (take a look at `wall`). The banner is optional. No error must be visible.  
> Your script must always be able to display the following information:  
> • The architecture of your operating system and its kernel version.  
> • The number of physical processors.  
> • The number of virtual processors.  
> • The current available RAM on your server and its utilization rate as a percentage.  
> • The current available memory on your server and its utilization rate as a percentage.  
> • The current utilization rate of your processors as a percentage.  
> • The date and time of the last reboot.  
> • Whether LVM is active or not.  
> • The number of active connections.  
> • The number of users using the server.  
> • The IPv4 address of your server and its MAC (Media Access Control) address.  
> • The number of commands executed with the sudo program.
>
> ![](../Pics/explain_script.png)
>
> This is an example of how the script is expected to work:  
> ![](../Pics/example_script.png)
> 
> This is an example to check if the subject's requirements are met:
> ![](../Pics/commands_requirements.png)

Used commands to check some of the subject’s requirements:  
`head -n 2 /etc/os-release`  
`/usr/sbin/aa-status`  
`ss-tunlp`  

## Commands
🚨 You need to install net-tools package to use `netstat` and `ifconfig`!  
`sudo apt install net-tools`  

1. The architecture of your operating system and its kernel version.  
```bash
hostnamectl | grep "Operating System" | sed 's/Operating System: //' | sed -e 's/[ \t]*//'  
hostnamectl | grep Kernel | sed 's/Kernel: //' | sed -e 's/[ \t]*//'  
hostnamectl | grep Architecture | sed 's/Architecture: //' | sed -e 's/[ \t]*//'  
```  

2. The number of physical and virtual processors.  
```bash
cat /proc/cpuinfo | grep "physical id" | sort | uniq | wc -l  
cat /proc/cpuinfo | grep processor | wc -l  
```  

3. The current available RAM and memory on your server and its utilization rate as a percentage.  
```bash
free -m | grep Mem | awk '{printf("%d/%dMB (%.2f%%)\n", $3, $2, $3/$2 * 100.0}'  
df -h / | awk 'NR==2{printf("%s/%s (%d%%)\n", $3, $2, $5)}'  
```  

4. The date and time of the last reboot.  
```bash
who -b | sed -e 's/system boot//' | sed -e 's/[ \t]*//'  
```  

5. Whether LVM is active or not.
```bash
LVM=$( cat /etc/fstab | grep "/dev/mapper" | wc -l )  
if [ $LVM -gt 0 ]  
then  
echo "#LVM use: yes"  
else  
echo "#LVM use: no"  
fi  
```  

6. The number of active connections.  
`awk </proc/net/tcp 'BEGIN{t=0};{if ($4 == "01") {t++;}};END{print t}'`
or
`netstat -ant | grep ESTABLISHED | wc -l`

7. The number of users using the server.  
```bash
who | uniq | wc -l  
```  

8. The IPv4 address of your server and its MAC (Media Access Control) address.  
```bash
apt-get install net-tools  
hostname -I` "("`ip address | grep "link/ether" | grep -ioE '([a-z0-9]{2}:){5}..' | head -1`")"  
```  

9. The number of commands executed with the sudo program.
```bash
`journalctl _COMM=sudo | grep COMMAND | uniq | wc -l`" cmd"  
```  

10. CPU load?
`cat /proc/stat | awk '{printf("%.1f%%\n", ($2+$4)*100.0/($2+$4+$5))}' | head -1`  


## Cron
1. Configure `cron` with `crontab -e` or as root with `sudo crontab -u root -e`.  
2. The script must run every 10 minutes. Look for this line:  
`23 # m h  dom mon dow   command`  
and replace it with  
`23 */10 * * * * sh /path/to/script`  
OR add the following lines:  
`@reboot sleep 7.5 && /root/script/monitoring.sh | wall`  
`*/10 * * * * /root/script/monitoring.sh | wall`  
3. Check root's scheduled cron jobs with `sudo crontab -u root -l`.  
4. 
```bash
sudo systemctl enable cron.service
sudo systemctl start cron.service
sudo systemctl stop cron.service
sudo systemctl restart cron.service
sudo systemctl status cron.service
```

## Usage
`sudo crontab -e` will get the script running (as root).  
Add following lines to your crontab file:  
`@reboot /path/to/file/monitoring.sh`  
`*/10 * * * * /path/to/file/monitoring.sh`  
🚨 You should write the FULL path to file (no ~/*/etc.) to make Cron happy and understand what you're talking about.