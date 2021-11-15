You have to install and configure sudo following strict rules:

To set up a strong configuration for your sudo group, you have to comply with the
following requirements:
• Authentication using sudo has to be limited to 3 attempts in the event of an incorrect password.
• A custom message of your choice has to be displayed if an error due to a wrong
password occurs when using sudo.
• Each action using sudo has to be archived, both inputs and outputs. The log file
has to be saved in the /var/log/sudo/ folder.
• The TTY mode has to be enabled for security reasons.
• For security reasons too, the paths that can be used by sudo must be restricted.
Example:
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin