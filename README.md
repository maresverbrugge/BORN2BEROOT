# BORN2BEROOT

<p align=center>
🌈 ✨ My Most Hated Project ✨ 🌈
</p>


![](Pics/crying.png)
<p align=center>
You can see why...
</p>

<p align=center>
Nice try of 42 to make it all a bit better:
</p>

![](Pics/bob.png)

## General guidelines
> • The use of VirtualBox (or UTM if you can’t use VirtualBox) is mandatory.
> 
> • You only have to turn in a signature.txt file at the root of your repository. You
must paste in it the signature of your machine’s virtual disk. Go to [submission and
peer-evaluation](https://github.com/maresverbrugge/BORN2BEROOT/tree/master/During_eval/Submission) for more information.

## Contents
● [Subject](https://github.com/maresverbrugge/BORN2BEROOT/blob/master/subject_B2BR.pdf)  
● [Eval Sheet](https://github.com/maresverbrugge/BORN2BEROOT/blob/master/eval_sheet_b2br.pdf)  

● [Hostname](https://github.com/maresverbrugge/BORN2BEROOT/tree/master/Hostname)  
● [Sudo](https://github.com/maresverbrugge/BORN2BEROOT/tree/master/Sudo)  
● [User and groups](https://github.com/maresverbrugge/BORN2BEROOT/tree/master/User_groups)  
● [SSH](https://github.com/maresverbrugge/BORN2BEROOT/tree/master/SSH)  
● [UFW](https://github.com/maresverbrugge/BORN2BEROOT/tree/master/UFW)  
● [Password](https://github.com/maresverbrugge/BORN2BEROOT/tree/master/Password)  
● [Script](https://github.com/maresverbrugge/BORN2BEROOT/tree/master/Script)  
● [Bonus](https://github.com/maresverbrugge/BORN2BEROOT/tree/master/Bonus)  

● [During Eval](https://github.com/maresverbrugge/BORN2BEROOT/tree/master/During_eval)  

## Setting Up Your VM
I followed [this link](https://www.brianlinkletter.com/2012/10/installing-debian-linux-in-a-virtualbox-virtual-machine/) to set up my VM.
At Codam, you need to set up your machine at storage/goinfre/your_intra_name because you need quite a lot of space.   
🚨 That "goinfre" folder is connected to a certain Mac so as long as you're working on this ✨amazing project✨, you're stuck at one computer. Unless you want to keep installing you're VM over and over again, of course!

## LVM / Partitions
To set up the encrypted partitions, I followed my friend Arrtthhuur's tutorial. Yes, you might want to use it too, but ONLY if you promise to ⭐️ his repo! His magic🧙🏻‍♂️ can be found [here](https://github.com/Arrtthhuur/Born2beRoot/blob/main/lvm/README.md#section).  
For the bonus part, I ended up following [this tutorial](https://github.com/HEADLIGHTER/Born2BeRoot-42/blob/main/walkthrough37.txt#L23).

🚨 "Since it is a matter of setting up a server, you will install the minimum of services. For this reason, a graphical interface is of no user here. It is therefore forbidden to install X.org or any other equivalent graphics server." 🚨
--> Deselect Desktop environment and GNOME from software selection during the install in order to get a Debian install without a Graphical User Interface. Also deselect SSH server & standart system utilities.


## Little trick
1. Turn off your VM
2. Go to settings in VirtualBox
3. Network -> Adapter 1 -> Advanced -> Port forwarding
4. Add new rule (little green button on right top side) and next parameters:


 Protocol | Host IP | Host Port | Guest IP | Guest Port
 -----------|---------|-----------|----------|---------
 TCP | 127.0.0.1 | 4242 | 10.0.2.15 | 4242      

5. In your host (physical) machine open Terminal and run `ssh -p <port> <user>@<hostname>` to login to your server.

Now you can control your virtual machine from the host terminal!



## Shout out 📣
To copain Arrtthhuur for making life just a bit easier 💕
