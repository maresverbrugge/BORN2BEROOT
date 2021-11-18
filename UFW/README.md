# UFW

## Subject
> You have to configure your operating system with the UFW firewall and thus leave only port 4242 open.  
> Your firewall must be active when you launch your virtual machine!

## Install
1. Install UFW with `sudo apt install ufw`. 
2. Check status with `sudo ufw status` and enable with `sudo ufw enable`.

## Configuration
1. It's likely that you need to allow SSH conncetions to your host with `sudo ufw allow ssh`. Check the existing rules with `sudo ufw status`.
2. Allow the right port with `sudo ufw allow 4242`.
3. Delete port 22 with `sudo ufw delete allow 22/tcp`. Check the existing rules again with `sudo ufw status`.
