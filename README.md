# Installation gitea by script | EN
The script, like the instruction itself, implies the use of debian or its forks

Important! This installation involves the use of sqlite, so when configuring from the web interface, install this type of database

Install git (debian):
```bash
apt install git -y
```

Install git (CentOS/Fedora/AlmaLinux):
```bash
dnf install git -y
```

Clone this repo:
```bash
git clone https://github.com/WolfAURman/gitea_server
```

Go to the working directory:
```bash
cd gitea_server
```

Make the file executable:
```bash
chmod +x install.sh
```

Important! Run the script from sudo, or use su, and run the script from it. But as practice shows, this is not necessary, and sudo is enough. Run it:
```bash
sudo ./install.sh
```
Wait for the installation and get a ready server with gitea. You will still need to go to the web interface and finish the setup. Access will be via your server's ip and will be open on port 3000

# Install gitea | manual installation | EN

## Downloads
```bash
wget -O gitea https://dl.gitea.io/gitea/1.16.9/gitea-1.16.9-linux-amd64
```

```bash
chmod +x gitea
```

Install git:
```bash
apt install git
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
Important! If you don't need it for a global project, you can use sqlite, this is selected when running in the browser. If you want to use sqlite, skip this step and move on to the next one!

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
![Screenshot from 2022-07-12 06-17-25](https://user-images.githubusercontent.com/93985232/178387400-c9ce46f4-fd6c-404b-9354-1455fc6ae041.png)
In the password field, enter the password that you specified when creating the password in MariaDB!
Then click install at the bottom of the page and wait for installation.

Congratulations! Gitea is installed, you can use it.

# Установка gitea при помощи скрипта | RU
Скрипт как и сама инструкция подразумевает использование debian или его форков

Важно! Данная установка подразумевает использование sqlite, поэтому при настройке из веб интерфейса установите именно этот тип базы данных

Установите git (Debian):
```bash
apt install git -y
```

Установите git (CentOS/Fedora/AlmaLinux):
```bash
apt install git -y
```

Клонируйте данное репо:
```bash
git clone https://github.com/WolfAURman/gitea_server
```

Перейдите в рабочую папку:
```bash
cd gitea_server
```

Сделайте файл исполняемым:
```bash
chmod +x install.sh
```

Важно! Запускайте скрипт от sudo, или же используйте su, и запускайте скрипт из него. Но как показывает практика это не нужно, и хватает sudo. Запустите его командой:
```bash
sudo ./install.sh
```
Дождитесь установки и получите готовый сервер с gitea. Вам всё так же необходимо будет зайти на веб интерфейс и окончить настройку. Доступ будет по ip вашего сервера и открыт будет на порту 3000

# Установка gitea | ручная установка | RU
## Скачка

```bash
wget -O gitea https://dl.gitea.io/gitea/1.16.9/gitea-1.16.9-linux-amd64
```

Установка git:
```bash
apt install git
```

Выдача необходимых привелегий:
```bash
chmod +x gitea
```

Создание пользователей и прочего:
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

Создание необходимых папок и выдача разрешений:
```bash
mkdir -p /var/lib/gitea/{custom,data,log} && chown -R git:git /var/lib/gitea/ && chmod -R 750 /var/lib/gitea/ && mkdir /etc/gitea && chown root:git /etc/gitea && chmod 770 /etc/gitea
```

Копирование нашего исполняемого файла:
```bash
cp gitea /usr/local/bin/gitea
```

## Установка машки (MariaDB)
Важно! Если вам не нужно для глобального проекта, можете использовать sqlite, это выбирается при запуске в браузере. Если вы хотите использовать sqlite пропустите этот этап и переходите к следующему!

Введите:
```bash
apt install mariadb-server
```

Залогиньтесь в машку:
```bash
mysql -u root -p
```

Создание базы данных:
```bash
CREATE DATABASE gitea;
```

Выдача правил базе данных и создание пароля:
```bash
GRANT ALL PRIVILEGES ON gitea.* TO 'gitea'@'localhost' IDENTIFIED BY "Ваш_пароль";
```
Сохранение изменений:
```bash
FLUSH PRIVILEGES;
```

Выход с машки:
```bash
QUIT;
```

## Создание файла запуска:
Enter:
```bash
nano /etc/systemd/system/gitea.service
```
Вставьте туда данные из этого файла - https://github.com/go-gitea/gitea/blob/main/contrib/systemd/gitea.service

После нажмите:
```bash
Ctrl + X
```
А так же впишите:
```bash
Y
```
Вы вышли и сохранили файл который мы создали

## Запуск gitea
Enter into the terminal:
```bash
systemctl enable gitea && systemctl start gitea
```

После залогиньтесь по ip сервера где стоит ваша gitea введя порт 3000:
```bash
ip_host:3000
```
![Screenshot from 2022-07-12 06-17-25](https://user-images.githubusercontent.com/93985232/178387400-c9ce46f4-fd6c-404b-9354-1455fc6ae041.png)
Обязательно введите в поле password ваш пароль что мы создали на этапе ранее, ведь иначе вас не пропустит дальше.
После посмотрите, полистайте и настройте что вам нужно кроме основных настроек что уже были установлены, и нажмите установка внизу страницы. Ожидайте немного времени, после можете пользоваться

Поздравляю! Gitea установлена, можете использовать.
