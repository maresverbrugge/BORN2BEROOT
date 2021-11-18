# Password

## Subject
You have to implement a strong password policy.

To set up a strong password policy, you have to comply with the following requirements:
• Your password has to expire every 30 days.
• The minimum number of days allowed before the modification of a password will
be set to 2.
• The user has to receive a warning message 7 days before their password expires.
• Your password must be at least 10 characters long. It must contain an uppercase
letter and a number. Also, it must not contain more than 3 consecutive identical
characters.
• The password must not include the name of the user.
• The following rule does not apply to the root password: The password must have
at least 7 characters that are not part of the former password.
• Of course, your root password has to comply with this policy.

* ! After setting up your configuration files, you will have to change
all the passwords of the accounts present on the virtual machine,
including the root account. ! *

## Configuration 
1. Install a password quality checking library with `sudo apt-get install libpam-pwquality`. Verify if it was sucesfully installed with `$ dpkg -l | grep libpam-pwquality`.
2. To set password expiration time etc, modify your file with `sudo nano /etc/login.defs`.
3. Change values:
• Your password has to expire every 30 days. --> `PASS_MAX_DAYS 30`
• The minimum number of days allowed before the modification of a password will be set to 2. --> `PASS_MIN_DAYS 2`.
• The user has to receive a warning message 7 days before their password expires. --> `PASS_WARN_AGE 7`.
4. ATTENTION: these settings only apply to the newly created users. You have to change all existing passwords according to your new password policy! You can either use `passwd` to change current user password, `passwd <user_name>` to change password of user OR use `chage <user_name>` to change all option like this.
Other commands to use:
`chage -M <days> <user_name>` to change password expiration date 
`chage -m <days> <user_name>` to change minimum number of days between password changes
`chage -W <days> <user_name>` to change warning message before password expires.
Run `chage -l <user_name>` to display password settings of user!
5. To set rules for password strength, modify your password configuration file (in Debian to be found in /etc/pam.d/) with `sudo nano /etc/pam.d/common-password`.
6. Look for the line `password        requisite                       pam_pwquality.so retry=3`
and add:
`minlen=10 ucredit=-1 dcredit=-1 maxrepeat=3 reject_username difok=7 enforce_for_root`
Explenation:
• Your password must be at least 10 characters long --> `minlen=10`
• It must contain an uppercase letter and a number. --> `ucredit=-1` for uppercase and `dcredit=-1` for digits/number.
• Also, it must not contain more than 3 consecutive identical characters. --> `maxrepeat=3`
• The password must not include the name of the user. --> `reject_username`
• The following rule does not apply to the root password: The password must have
at least 7 characters that are not part of the former password. --> `difok=7`
• Of course, your root password has to comply with this policy. --> `enforce_for_root`
