# User and groups

## Subject
> • In addition to the root user, a user with your login as username has to be present.  
> • This user has to belong to the user42 and sudo groups.  
> • During the defense, you will have to create a new user and assign it to a group.

## Commands
1. Make user with your username with `sudo adduser <yourusername>`.  
2. Add group called "user42" with `sudo addgroup user42`.  
3. Add user to group with `sudo adduser <username> <groupname>`.  
Make sure the user with your login name belongs to groups "user42" and "sudo" so run  
`sudo adduser mverbrug user42` and `sudo adduser mverbrug sudo`.
4. To know in which groups a user is, `groups <username>`.  
5. To list all users, run `getent passwd`.  
6. To list all groups, run `getent group`.  
7. To list all user in a certain group, run `getent group <name_of_group>`, like: `getent group sudo`.  

8. Delete user with `duserdel <user_name>` or `userdel -r <user_name>` to remove the user's home folder and email folder.  
If an error occurs saying that user is being used by process xx, run `pkill -9 <pid>` with `pid` = process id.
