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

1. Dispaly the architecture of your operating system and its kernel version.  

UITLEGGEN HOE SCRIPT IS OPGEBOUWD!!!

## Cron
1. Configure `cron` with `crontab -e` or as root with `sudo crontab -u root -e`.  
2. The script must run every 10 minutes. Add the following lines:  
`@reboot sleep 7.5 && /root/script/monitoring.sh | wall`  
`*/10 * * * * /root/script/monitoring.sh | wall`  
🚨 You should write the FULL path to file (no ~/*/etc.) to make Cron happy and understand what you're talking about.  
3. Check root's scheduled cron jobs with `sudo crontab -u root -l`.  

4. Sometimes, cron will disregard the output because we haven't set up the "Mail To Address". To disable it, add this line at the top of the crontab:  
```bash   
crontab -e  
  
MAILTO=""  
``` 
So.....  
Crontab file will look like this:  
```bash 
MAILTO=""  
  
@reboot sleep 7.5 && /root/Script/monitoring.sh  
*/10 * * * * /root/Script/monitoring.sh  
``` 

## Cron Commands  
```bash  
sudo systemctl enable cron.service  
sudo systemctl start cron.service  
sudo systemctl stop cron.service  
sudo systemctl restart cron.service  
sudo systemctl status cron.service  
```
