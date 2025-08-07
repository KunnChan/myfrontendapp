# React + Vite

This template provides a minimal setup to get React working in Vite with HMR and some ESLint rules.

Currently, two official plugins are available:

Useful commands:

```bash
# npm 7+, extra double-dash is needed:
npm create vite@latest myfrontednapp -- --template react

cat /var/log/userdata.log

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

```

### Common Error

- Jenkins 403 error

  - Go to Security > Enable Security Proxy

- Zoho Create New App Guide
  https://accounts.zoho.com/home#security/security_pwd
  https://www.zoho.com/mail/help/adminconsole/two-factor-authentication.html#password

- GitHub Personal Token

  - Go to GitHub → Settings → Developer settings → Personal access tokens (Classic)
  - Scope: repo, admin:repo_hook

- Add Webhook in GitHub Repo

  - Go to your GitHub repository
  - Click Settings → Webhooks
  - Click “Add webhook”

  - Payload URL http://<jenkins-server>:8080/github-webhook/
  - Content type application/json
  - Secret (optional — match in Jenkins if used)
  - Events Choose: Just the push event
  - Click “Add webhook”

  http://ec2-47-129-151-18.ap-southeast-1.compute.amazonaws.com:8080/github-webhook/

Update readme
