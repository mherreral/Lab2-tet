# Lab2 - part 2
Deploy and containerize webapp consisting of backend and frontend.

## Table of contents
* [Database configuration](#db)
* [Introduction](#intro)
* [Virtual machine configuration](#config)
* [Front configuration](#front)
* [Generating certs](#ssl)
* [Docker compose](#dc)

### Database configuration <a name="db"></a>
- Go to https://www.mongodb.com/cloud/atlas and create an account
- Create a cluster
- Create a new database named bookStore and new collection named books

### Introduction <a name="intro"></a>

**Configure virtual machines with Amazon EC2**:
- Log in into AWS console and click in launch instances
- Select AMI corresponding to Ubuntu 20
- Select t2.micro type of machine
- Set number of instances field with "2"
- Configure VPC and subnet
- Set storage to 20 GiB
- Configure security group, allowing traffic through port 80, 443. Also allow ICMP and ssh traffic.

**Elastic ips**:
- Go to AWS console *Network and Security* > *Elastic ips* > *Allocate elastic ip*
- Once we allocate two elastic ips, we attach each one of them to each vm created in previous step

***

**Back and front configuration**:
- Ssh into machines
- It can be good to change the hostname of both machines, first change preserve_hostname: true in /etc/cloud/cloud.cfg and then the following commands in each vm

```
$ sudo hostnamectl set-hostname back
```

```
$ sudo rebbot
```

### Front config <a name="front"></a>
- Update server
  
```
$ sudo su; apt update; apt upgrade -y
```

- Install nginx

```
$ apt install nginx -y
```

- Edit nginx server conf in file vim */etc/nginx/sites-available/default*, add *root /usr/share/nginx/html/bookstore*
<p align="center"><img src="https://drive.google.com/uc?export=view&id=1aLQHA_kq8vErndq9vo_ksK0kbaEWB8ev"></p>

- 