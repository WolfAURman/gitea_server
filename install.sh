#!/bin/bash
## Section for Debian

if grep 'Debian GNU/Linux' /etc/os-release > /dev/null 2>&1 #NAME in /etc/os-release

then

	apt update && apt upgrade -y
	wget -O gitea https://dl.gitea.io/gitea/1.17.1/gitea-1.17.1-linux-amd64
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
	wget -O gitea https://dl.gitea.io/gitea/1.17.1/gitea-1.17.1-linux-amd64
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
	wget -O gitea https://dl.gitea.io/gitea/1.17.1/gitea-1.17.1-linux-amd64
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
	wget -O gitea https://dl.gitea.io/gitea/1.17.1/gitea-1.17.1-linux-amd64
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
