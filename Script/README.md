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

Your script must:  
1. Display the architecture of your operating system and its kernel version.    
`$(uname -a)` to print ALL information of user name (architecture and kernel version).  
2. Display the number of physical processors.  
`grep "physical id" /proc/cpuinfo | sort | uniq | wc -l`  
3. Display the number of virtual processors.  
`grep "processor" /proc/cpuinfo | wc -l`  
4. Display the current available RAM and memory on your server and its utilization rate as a percentage.  
`df` for displaying available space on a file system  
`df -Bg | grep '^/dev/' | grep -v '/boot$' | awk '{ft += $2} END {print ft}'` to get total disk boot space  
`df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} END {print ut}'` to get used disk boot space  
`df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} {ft+= $2} END {printf("%d"), ut/ft*100}'` to get percentage of utilization  
`free -m` to get info on memory  
`awk` to pick specific fields  
`free -m | awk '$1 == "Mem:" {print $2}'` to get total memory on server  
`free | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}'` to get percentage of utilization  
5. Display the current utilization rate of your processors as a percentage.  
`top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $3}'` to get percentage of processor (CPU) utilization  
6. Display the date and time of the last reboot.  
`who -b` to get info on time of last boot  
`who -b | awk '$1 == "system" {print $3 " " $4}'` to print day and time of last boot  
7. Display whether LVM is active or not.  
`lsblk` for info on partitions  
`lsblk | grep "lvm" | wc -l`  to get info on lvm  
`if [ $lvm -eq 0 ]; then echo no; else echo yes; fi` to check if lvm is in use and print yes or no  
8. Display the number of active connections.  
`cat /proc/net/sockstat{,6} | awk '$1 == "TCP:" {print $3}'` to display tcp connections.  
9. Display the number of users using the server.  
`users | wc -w` to display users  
10. Display the IPv4 address of your server and its MAC (Media Access Control) address.  
`hostname -I` to get IP address  
`ip link show | awk '$1 == "link/ether" {print $2}'` to get MAC address  
11. Display the number of commands executed with the sudo program.  
`journalctl` for information on logs   
`journalctl _COMM=sudo | grep COMMAND | wc -l` to get logs on sudo commands  

## Cron
1. Configure `cron` with `crontab -e` or as root with `sudo crontab -u root -e`.  
2. The script must run every 10 minutes. Add the following lines:  
`@reboot sleep 7.5 && /root/script/monitoring.sh`  
`*/10 * * * * /root/script/monitoring.sh`  
🚨 You should write the FULL path to file (no ~/*/etc.) to make Cron happy and understand what you're talking about. 🚨  
3. Sometimes, cron will disregard the output because we haven't set up the "Mail To Address". To disable it, `crontab -e` and add this line at the top of the crontab:  
`MAILTO=""`  
4. Check root's scheduled cron jobs with `sudo crontab -u root -l`.  

## Cron Commands  
```bash  
sudo systemctl enable cron.service  
sudo systemctl start cron.service  
sudo systemctl stop cron.service  
sudo systemctl restart cron.service  
sudo systemctl status cron.service  
```

## Permission
Once your script is ready, set the executable permission for the “monitoring.sh” file.  
`chmod +x /path/to/file/monitoring.sh`  