#!/bin/bash

## Creating a dump
chown -R git:git ~/
chown -R git:git /usr
su git -c "gitea dump -c /etc/gitea/app.ini"
mkdir ~/dump
cp gitea-dump-*.zip ~/dump

## Downloading and updating to the current version
systemctl disable gitea.service
systemctl stop gitea.service
wget -O gitea https://dl.gitea.io/gitea/1.16.9/gitea-1.16.9-linux-amd64
chmod +x gitea
rm -rf /usr/local/bin/gitea
cp gitea /usr/local/bin/gitea
systemctl enable gitea.service
systemctl start gitea.service

## Garbage removal
rm -rf gitea
rm -rf gitea-dump-*.zip
