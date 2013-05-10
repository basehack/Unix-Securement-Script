Unix-Secure-Script
==================

Secures rooted *nix servers - http://basehack.net/member.php?action=profile&amp;uid=48 - http://www.hackforums.net/member.php?action=profile&amp;uid=397679

Ever root a server and wanted to secure it for yourself? This script secures the box for you with features such as:

  iptables configuration to make it so only you can access it
 
  A reverse-shell
 
  Rootkit scanner
 
 And more.
 
 --
 
 Keep in mind this is a quick draft I made in 3 minutes, I have many more features to come such as:
 
   An LD_PRELOAD rootkit hooker
  
   A random SSH port chooser
  
   /etc/shadow password changer 
  
--

Currently works on/tested on:
  
  Red Hat, Fedora, CentOS, Gentoo, Arch, Mangeria, Debian, Ubuntu, Mint and CrunchBang.

--

Versions for each one:

Debian/Ubuntu/Crunchbang/Mint: secureapt.sh

Red Hat/Fedora/CentOS: secureyum.sh

Gentoo: secureemerge.sh

Arch: securepacman.sh

Mangeria: secureurpmi.sh
