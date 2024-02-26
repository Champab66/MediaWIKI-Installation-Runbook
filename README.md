# MediaWIKI-Installation-Runbook

## Prerequisites

---

1. Azure account with valid subscription plan 
2. Terraform installed
3. Ansible installed

## 1. Provision Infrastructure using Terraform

---

1. Clone the GIT repository 

```
git clone https://github.com/Champab66/MediaWIKI-Installation-Runbook.git
```

1.a Make below changes to the terraform script
 1.a.i
 2.b.ii

1.b Run the below terraform commands
 1.a.i Terraform init
 ```
 terraform init
 ```
 1.b.ii Terraform plan
 ```
 terraform init
 ```
 1.c.iii Terraform apply
 ```
 terraform init
 ```

4. Connect to the azure VM.
 Obtain the public IP of the azure VM and connect it via ssh
 ```
 ssh your-vm-user-name@public-ip
 ```

## 2. Configure MediaWiki Installation using Ansible

---

2.a Install ansible on azure VM using below steps:
 
2.b Create ansible inventory

2.c Create ansible playbook

2.d Create 

## 3. TroubleSooting 