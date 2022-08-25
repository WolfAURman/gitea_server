#!/bin/bash
##
clear
##
echo "|========================================|"
echo "|               Hey! Hello!              |"
echo "|   Have you decided to install gitea    |"
echo "|             on your server             |"
echo "|  This script will help you with this   |"
echo "|         Answer a few questions         |"
echo "|   and then wait for the installation   |"
echo "|========================================|"
echo "|             Successful use!            |"
echo "|========================================|"
echo "|   The installation will start in 10s   |"
echo "|========================================|"
##
sleep 10
##
clear
##
echo "|========================================|"
echo "|  Which version do you want to install? |"
echo "|      These versions are available:     |"
echo "|========================================|"
echo "|                 1.16.7                 |"
echo "|                 1.16.8                 |"
echo "|                 1.16.9                 |"
echo "|                 1.17.0                 |"
echo "|             1.17.1 - latest            |"
echo "|========================================|"
echo "                                          "
##
read -p "     Enter the version name: " ver
echo "                                          "
##
echo "|========================================|"
echo "| Ok, you have chosen the $ver version |  "
echo "|               Installing...            |"
echo "|========================================|"
##
clear
##

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
	systemctl enable gitea
	systemctl start gitea

fi

## Section for Fedora

if grep 'Fedora Linux' /etc/os-release > /dev/null 2>&1 #NAME in /etc/os-release

then

	dnf update -y && dnf install wget -y
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
	systemctl enable gitea
	systemctl start gitea

fi

## Section for AlmaLinux

if grep 'AlmaLinux' /etc/os-release > /dev/null 2>&1 #NAME in /etc/os-release

then

	dnf update -y && dnf install wget -y
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
	systemctl enable gitea
	systemctl start gitea

fi

## Section for CentOS

if grep 'CentOS' /etc/os-release > /dev/null 2>&1 #NAME in /etc/os-release

then

	dnf update -y && dnf install wget -y
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
	systemctl enable gitea
	systemctl start gitea

fi

##
clear
##
echo "                                                    "                                               
echo "      @%%%%%%%%%%%%%%%%%%%%%%%%+-%%%%%%%%%%%%%%%%%% "
echo "    @%%%%%%%%%%%%%%%%%%%%%%%%%%*.%%%%%%%%%%%%%%%%%% "
echo "   %%%%     @%%%%%%%%%%%%%%%%%%*.%%%%%%%%%%%%%%%%%% "
echo "   %%%       %%%%%%%%%%%%%%%%%%*.%%%%%%%%%%%%%%%%%% "
echo "  @%%%       %%%%%%%%%%%%%%+--++.%%%%%%%%%%%%%%%%%% "
echo "   %%%       @%%%%%%%%%%%%*   .=--+%%%%%%%%%%%%%%%@ "
echo "   %%%%       %%%%%%%%%%%*   +%=     .*%%%%%%%%%%%  "
echo "    %%%%%      %%%%%%%%%+   .=:.:=*    -%%%%%%%%%@  "
echo "      %%%%%%%%@%%%%%%%%+   .=-   .=-  .=%%%%%%%%%   "
echo "        @%%%%%%%%%%%%%+   +%+   .=:  .=%%%%%%%%%    "
echo "                @%%%%%%:. .:.  *%+  .=%%%%%%%%%     "
echo "                  %%%%%%%%=:.  -+- .=%%%%%%%%%@     "
echo "                   %%%%%%%%%%%=*. .=%%%%%%%%%       "
echo "                    @%%%%%%%%%%%%%%%%%%%%%%%        "
echo "                       %%%%%%%%%%%%%%%%%%@          "
echo "                                                    "
echo "                                                    "
echo "            Thank you for using my script!          "
echo "           Visit http://ip_your_server:3000         "
echo "      For further installation and configuration    "
echo "                                                    "
