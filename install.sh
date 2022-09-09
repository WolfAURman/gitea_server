#!/bin/bash

clear

function init () {
    echo "
|========================================|
|               Hey! Hello!              |
|   Have you decided to install gitea    |
|             on your server             |
|  This script will help you with this   |
|         Answer a few questions         |
|   and then wait for the installation   |
|========================================|
|             Successful use!            |
|========================================|
|   The installation will start in 10s   |
|========================================|"
sleep 10 && clear
}

init

function init1 () {
    echo "
|========================================|
|  Which version do you want to install? |
|      These versions are available:     |
|========================================|
|                 1.16.8                 |
|                 1.16.9                 |
|                 1.17.0                 |
|                 1.17.1                 |
|             1.17.2 - latest            |
|========================================|
"
}

init1

read -p "     Enter the version name: " ver

function init2 () {
   clear
    echo "
|========================================|
| Ok, you have chosen the $ver version |  
|               Installing...            |
|========================================|
"
}

init2

## Section for Debian

if grep 'Debian GNU/Linux' /etc/os-release > /dev/null 2>&1 #NAME in /etc/os-release

then

	apt update && apt upgrade -y
	wget -O gitea https://dl.gitea.io/gitea/$ver/gitea-$ver-linux-amd64
	chmod +x gitea
	adduser \
	   --system \
	   --shell /bin/bash \
	   --gecos 'Git Version Control' \
	   --group \
	   --disabled-password \
	   --home /home/git \
	   git
	mkdir -p /var/lib/gitea/{custom,data,log}
	chown -R git:git /var/lib/gitea/
	chmod -R 750 /var/lib/gitea/
	mkdir /etc/gitea
	chown root:git /etc/gitea
	chmod 770 /etc/gitea
	cp gitea /usr/local/bin/gitea
	cp gitea.service /etc/systemd/system
	systemctl enable --now gitea

fi

## Section for RHEL and its forks

if ls /etc/redhat-release > /dev/null 2>&1

then

	dnf install wget -y
	wget -O gitea https://dl.gitea.io/gitea/$ver/gitea-$ver-linux-amd64
	chmod +x gitea
	adduser \
	   --shell /bin/bash \
	   --home /home/git \
	   git
	mkdir -p /var/lib/gitea/{custom,data,log}
	chown -R git:git /var/lib/gitea/
	chmod -R 750 /var/lib/gitea/
	mkdir /etc/gitea
	chown root:git /etc/gitea
	chmod 770 /etc/gitea
	cp gitea /usr/local/bin/gitea
	cp gitea.service /etc/systemd/system
	systemctl enable --now gitea

fi

function init3 () {
   clear
    echo "                                              
      @%%%%%%%%%%%%%%%%%%%%%%%%+-%%%%%%%%%%%%%%%%%% 
    @%%%%%%%%%%%%%%%%%%%%%%%%%%*.%%%%%%%%%%%%%%%%%% 
   %%%%     @%%%%%%%%%%%%%%%%%%*.%%%%%%%%%%%%%%%%%% 
   %%%       %%%%%%%%%%%%%%%%%%*.%%%%%%%%%%%%%%%%%% 
  @%%%       %%%%%%%%%%%%%%+--++.%%%%%%%%%%%%%%%%%% 
   %%%       @%%%%%%%%%%%%*   .=--+%%%%%%%%%%%%%%%@ 
   %%%%       %%%%%%%%%%%*   +%=     .*%%%%%%%%%%%  
    %%%%%      %%%%%%%%%+   .=:.:=*    -%%%%%%%%%@  
      %%%%%%%%@%%%%%%%%+   .=-   .=-  .=%%%%%%%%%   
        @%%%%%%%%%%%%%+   +%+   .=:  .=%%%%%%%%%    
                @%%%%%%:. .:.  *%+  .=%%%%%%%%%     
                  %%%%%%%%=:.  -+- .=%%%%%%%%%@     
                   %%%%%%%%%%%=*. .=%%%%%%%%%       
                    @%%%%%%%%%%%%%%%%%%%%%%%        
                       %%%%%%%%%%%%%%%%%%@          
                                                    
                                                    
            Thank you for using my script!          
           Visit http://ip_your_server:3000         
      For further installation and configuration    
"
}

init3
