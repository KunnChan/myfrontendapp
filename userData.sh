#!/bin/bash
# --- System update ---
yum update -y

# --- Install Java 21 (Amazon Corretto) ---
yum install -y java-21-amazon-corretto

# --- Install Node.js 22 ---
curl -fsSL https://rpm.nodesource.com/setup_22.x | bash -
yum install -y nodejs

# --- Install Git and build tools ---
yum install -y git wget unzip

# --- Install Jenkins (latest stable) ---
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install -y jenkins

# --- Enable and start Jenkins service ---
systemctl enable jenkins
systemctl start jenkins

# --- Add firewall rule (optional) ---
# Uncomment below if you want to open port 8080 using firewalld
# yum install -y firewalld
# systemctl enable firewalld
# systemctl start firewalld
# firewall-cmd --permanent --add-port=8080/tcp
# firewall-cmd --reload

# --- Log versions (debugging) ---
echo "Java Version:" >> /var/log/userdata.log
java -version >> /var/log/userdata.log 2>&1

echo "Node Version:" >> /var/log/userdata.log
node -v >> /var/log/userdata.log

echo "NPM Version:" >> /var/log/userdata.log
npm -v >> /var/log/userdata.log

echo "Jenkins Status:" >> /var/log/userdata.log
systemctl status jenkins >> /var/log/userdata.log 2>&1
