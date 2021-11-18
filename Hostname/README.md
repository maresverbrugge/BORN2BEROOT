# Hostname

## Subject
The hostname of your virtual machine must be your login ending with 42 (e.g.,
wil42). You will have to modify this hostname during your evaluation.

## Configuration
1. `hostnamectl` to display current hostname.
2. `su` to become root.
3. `hostnamectl set-hostname <server_name>` to change your hostname to a new server_name.
4. `nano /etc/hosts` and replace all occurences of previous server_name to new server_name.
