#!/bin/sh
#
sudo apt-get install python-pip -y
sudo pip install awscli
sudo apt-get install curl -y
curl uplus.loc/ec2backuper.cred
sudo aws configure
mkdir -p /opt/aws
cd /opt/aws
wget https://raw.githubusercontent.com/CaseyLabs/aws-ec2-ebs-automatic-snapshot-bash/master/ebs-snapshot.sh
chmod +x ebs-snapshot.sh
echo "55 22 * * * root  AWS_CONFIG_FILE="/root/.aws/config" /opt/aws/ebs-snapshot.sh" >> /etc/cron.d/ec2backuper
