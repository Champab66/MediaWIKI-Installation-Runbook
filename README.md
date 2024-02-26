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
 
2.b Create ansible inventory, playbook and mediawiki.conf.j2 present inside the Ansible folder of the GIT repo.

Run the ansible playbook
```
ansible -i inventory mediawiki-playbook.yml
```

Check all the tasks have completed successfully
https://github.com/Champab66/MediaWIKI-Installation-Runbook/blob/98463359284b5e03a3f70ce4ea5de298a220b0ad/Images/Screenshot%20(2).png

## 3. TroubleSooting 
