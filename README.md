# MediaWIKI-Installation-Runbook

## Prerequisites

---

1. Azure account to create azure VM using terraform 
2. Terraform installed
3. Ansible installed

## Provision Infrastructure using Terraform

---

1. Clone the GIT repository 

```
git clone https://github.com/Champab66/MediaWIKI-Installation-Runbook.git
```
Navigate to the playbook

```
cd MediaWIKI-Installation-Runbook
``` 

Run the below terraform commands
 1. Initialize terraform

 ```
 terraform init
 ```

 2. See what changes will be implemented

 ```
 terraform plan
 ```

 3. Apply the Terraform configuration

 ```
 terraform apply
 ```

Connect to the azure VM.
 Obtain the public IP of the azure VM and connect it via ssh

 ```
 ssh ssh-user-name@public-ip
 ```

## Configure MediaWiki Installation using Ansible

---

### Install ansible on azure VM using below steps:
 
Create ansible inventory, playbook and mediawiki.conf.j2 present inside the Ansible folder of the GIT repo.

Run the ansible playbook
```
ansible -i inventory mediawiki-playbook.yml
```

Check all the tasks have completed successfully
https://github.com/Champab66/MediaWIKI-Installation-Runbook/blob/98463359284b5e03a3f70ce4ea5de298a220b0ad/Images/Screenshot%20(2).png

Check apache2 and mysql is running
```
sudo systemctl status apache2
```

```
sudo systemctl status mysql
```

Open the browser and type this url
```
http://your-vm-public-ip//mediawiki-1.41.0
```

## TroubleSooting 

