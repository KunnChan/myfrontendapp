# React + Vite

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

Useful commands:

```bash
# npm 7+, extra double-dash is needed:
npm create vite@latest myfrontednapp -- --template react
```

# 1. Update the system

sudo yum update -y

# 2. Install Java 21 (Amazon Corretto 21)

sudo yum install java-21-amazon-corretto -y

# 3. Add Jenkins repo and import GPG key

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

# 4. Install Jenkins

sudo yum install jenkins -y

# 5. Start and enable Jenkins

sudo systemctl start jenkins
sudo systemctl enable jenkins
