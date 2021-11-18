# SSH

## Subject
> The use of SSH will be tested during the defense by setting up a new account. You must therefore understand how it works.  
> A SSH service will be running on port 4242 only. For security reasons, it must not be possible to connect using SSH as root.

## Install
To be able to install a SSH server on Debian, you need to have sudo privileges. To check if you have those priviliges, run `groups` and check if "sudo" is there.  
1. Make sure all necessary packages are updates by running `sudo apt-get update`.  
2. `sudo apt install openssh-server` to install OpenSSH. In your console you'll see that a configuration file called "sshd_config" is created in the /etc/ssh folder.  
3. To check if the SSH server was correctly created and running, run `sudo systemctl status ssh`. By default, your SSH server is listening on port 22.


## Configuration
It is important for your SSH server to be correctly configured. If not, you are at risk when it comes to SSH attacks and your entire infrastructure can be compromised easily.  

As mentioned above, the SSH configuration files are located in the /etc/ssh folder. In this directory, you will also find:  
**ssh_config** : is used in order to configure SSH clients. It means that it defines rules that are applied everytime you use SSH to connect to a remote host or to transfer files between hosts.  
**sshd_config** : is used in order to configure your SSH server. It is used for example to define the reachable SSH port or to deny specific users from communicating with your server.  

1. To change the default assigned by the OpenSSH server, open the config file by running `sudo nano /etc/ssh/sshd_config` and change line "#Port 22" to "Port 4242". Make sure to lose the # at the beginning of the line!  
2. Change `#PermitRootLogin prohibit-password` to `PermitRootLogin no` to disable root login on your SSH server.  
3. Restart SSH server to apply changes: `sudo systemctl restart sshd` en `sudo systemctl status sshd`. Check if SSH server is now listining on the port you specified earlier.  
4. Connect your SSH server by running `ssh -p <port> <username>@<ip_address>or<hostname>`.  
(So I'll run `ssh -p 4242 mverbrug@mverbrug42`). Provide your password.  

5. If you want to exit your SSH Server type `logout`.  
6. If you want to disable your SSH Server, run `sudo systemctl stop sshd` and `sudo systemctl status sshd` to verify.  
