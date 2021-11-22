#!/bin/bash
# MAKE VARIABLES AND STORE INFO IN IT
arch=$(uname -a)
cpu=$(grep "physical id" /proc/cpuinfo | sort | uniq | wc -l)
vcpu=$(grep "processor" /proc/cpuinfo | wc -l)
full_ram=$(free -m | awk '$1 == "Mem:" {print $2}')
used_ram=$(free -m | awk '$1 == "Mem:" {print $3}')
pram=$(free | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')
full_disk=$(df -Bg | grep '^/dev/' | grep -v '/boot$' | awk '{ft += $2} END {print ft}')
used_disk=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} END {print ut}')
pdisk=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} {ft+= $2} END {printf("%d"), ut/ft*100}')
cpu_load=$(top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $3}')
last_boot=$(who -b | awk '$1 == "system" {print $3 " " $4}')
lvm=$(lsblk | grep "lvm" | wc -l)
lvm_use=$(if [ $lvm -eq 0 ]; then echo no; else echo yes; fi)
tcp_con=$(cat /proc/net/sockstat{,6} | awk '$1 == "TCP:" {print $3}')
user_log=$(users | wc -w)
ip=$(hostname -I)
mac=$(ip link show | awk '$1 == "link/ether" {print $2}')
sudo_cmds=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

# PRINT INFO THROUGH WALL

wall "  #Architecture: $arch
        #CPU physical: $cpu
        #vCPU: $vcpu
        #Memory Usage: $used_ram/${full_ram}MB ($pram%)
        #Disk Usage: $used_disk/${full_disk}Gb ($pdisk%)
        #CPU load: $cpu_load
        #Last boot: $last_boot
        #LVM use: $lvm_use
        #Connexions TCP: $tcp_con ESTABLISHED
        #User log: $user_log
        #Network: IP $ip ($mac)
        #Sudo: $sudo_cmds cmd"