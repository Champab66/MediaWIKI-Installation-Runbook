# MediaWIKI-Installation-Runbook

This is a runbook guide that helps to deploy MediaWiki using Terraform and Ansible
## Prerequisites

---

1. Azure account to create azure VM using terraform 
2. Terraform installed
3. Ansible installed

## Provision Infrastructure using Terraform

---
1. Login to your azure account

```
az login
```

2. Clone the GIT repository 

```
git clone https://github.com/Champab66/MediaWIKI-Installation-Runbook.git
```

3. Navigate to the playbook

```
cd MediaWIKI-Installation-Runbook
``` 

4. Run the below terraform commands
   
  4.a Initialize terraform

 ```
 terraform init
 ```

  4.b See what changes will be implemented

 ```
 terraform plan
 ```

   4.c Apply the Terraform configuration

 ```
 terraform apply
 ```

5. Connect to the azure VM.
   
 Obtain the public IP of the azure VM and connect it via ssh

 ```
 ssh your-user-name@public-ip
 ```

## Configure MediaWiki Installation using Ansible

---

### Install ansible on azure VM using below steps:
1.a 
1.b
 
2. Create ansible inventory, playbook and mediawiki.conf.j2 present inside the Ansible folder of the GIT repo.

3. Run the ansible playbook
   
```
ansible -i inventory mediawiki-playbook.yml
```

4. Check all the tasks have completed successfully
   
![Screenshot (2)](https://github.com/Champab66/MediaWIKI-Installation-Runbook/assets/157747315/8dc26ce4-728a-4c63-b1b7-19e6ca7a7615)

5. Check apache2 and mysql is running
   
```
sudo systemctl status apache2
```

```
sudo systemctl status mysql
```

6. Open the browser and type this url
```
http://your-vm-public-ip//mediawiki-1.41.0
```
7. Follow the steps to create your own wiki
   
![Screenshot (3)](https://github.com/Champab66/MediaWIKI-Installation-Runbook/assets/157747315/8f355595-5a34-43c1-8206-142b58cb1e4c)

   

