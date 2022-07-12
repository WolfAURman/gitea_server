# Install gitea | EN

## Downloads
```bash
wget -O gitea https://dl.gitea.io/gitea/1.16.9/gitea-1.16.9-linux-amd64
```
```bash
chmod +x gitea
```
## Creating the necessary data 

Enter:
```bash
adduser \
   --system \
   --shell /bin/bash \
   --gecos 'Git Version Control' \
   --group \
   --disabled-password \
   --home /home/git \
   git
```

```bash
mkdir -p /var/lib/gitea/{custom,data,log} && chown -R git:git /var/lib/gitea/ && chmod -R 750 /var/lib/gitea/ && mkdir /etc/gitea && chown root:git /etc/gitea && chmod 770 /etc/gitea
```

```bash
cp gitea /usr/local/bin/gitea
```

## Install mairadb
Enter:
```bash
apt install mariadb-server
```

Then log in to our MariaDB:
```bash
mysql -u root -p
```

Creating a gitea database:
```bash
CREATE DATABASE gitea;
```

We issue rights and also create a password for the database:
```bash
GRANT ALL PRIVILEGES ON gitea.* TO 'gitea'@'localhost' IDENTIFIED BY "<Type_Your_Password>";
```

Saving changes:
```bash
FLUSH PRIVILEGES;
```

Exiting MariaDB:
```bash
QUIT;
```

## Creating a startup file
Enter:
```bash
nano /etc/systemd/system/gitea.service
```
Then paste all the lines from this file - https://github.com/go-gitea/gitea/blob/main/contrib/systemd/gitea.service

Then press:
```bash
Ctrl + X
```
And after
```bash
Y
```
You log out and save the file we just created

## Launching gitea
Enter into the terminal:
```bash
systemctl enable gitea && systemctl start gitea
```

Then go to your ip address that belongs to the server where your gita is hosted by entering:
```bash
ip_host:3000
```


# Установка gitea RU
