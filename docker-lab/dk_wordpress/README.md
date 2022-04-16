# Lab2 - part 1

## Table of contents
* [Files explanation](#files)
* [Introduction](#intro)
* [Virtual machine configuration](#config)
* [Generating certs](#ssl)
* [Docker compose](#dc)

### Files explanation <a name="files"></a>
In this directory you will find the following files:
- **docker-compose.yml**: In this file are located the rules  for wordpress and mysql container. I added volumes associated to *tet-lab2.tk.conf*, base dir and ssl certificates location
- **tet-lab2.tk.conf**: In this file is described the apache virtualhost, with its ssl certs associations

### Introduction <a name="intro"></a>
First part of Tópicos especiales en telemática laboratory, In this directory you'll find a base installation and configuration of apache wordpress container secured with letsencrypt.

There are some configurations needed before starting with main activity:

**Configure virtual machine with Amazon EC2**:
- Log in into AWS console and click in launch instances
- Select AMI corresponding to Ubuntu 20
- Select t2.micro type of machine
- Configure VPC and subnet, and *enable public ip association*
- Set storage to 20 GiB
- Configure security group, allowing traffic through port 80, 443. Also allow ICMP and ssh traffic.

***

**Obtain domain**
For obtaining a free domain, i made use of freenom.
- Create an account in that platform
- Request a domain, I selected tet-lab2.tk

**Add domain to DNS with cloudflare**
- Create an account in cloudflare
- Click on *add site*
- They will ask for updating your domain nameservers to cloudflare ones
<p align="center"><img src="https://drive.google.com/uc?export=view&id=1d294mQp5iyiKFrA7bSV1HE8BGBtiD4uq"></p>

- Then, cloudflare will send you an email confirming management of domain

**Cloudflare DNS configuration**
- Click in DNS section
<p align="center"><img src="https://drive.google.com/uc?export=view&id=1WL7F5Ty3HvbCETItb3jQggAQfV3uPo8k"></p>

- Add A record pointing to public ip associated with your EC2 instance

***

### VM Configuration <a name="config"></a>
In script *setup.sh* are described the base steps for getting docker and docker-compose functional in ubuntu

### Generating certs <a name="ssl"></a>
After downloading certbot, we should run
``` 
$ sudo certbot certonly   --manual   --preferred-challenges dns   -d tet-lab2.tk -d "*
.tet-lab2.tk" -i apache
``` 

The command will ask to add DNS TXT records, you will have to add them into cloudflare DNS management and it will generate the files under */etc/letsencrypt/live/<domain>* folder
<p align="center"><img src="https://drive.google.com/uc?export=view&id=1z5PfgkHiDJ-tBd831PUcuFJkwL9SK9Bf"></p>

Now we are done to run docker compose

### Docker compose <a name="dc"></a>
Run
<p align="center"><img src="https://drive.google.com/uc?export=view&id=1vlYeyA4d7xcqs6HxNwWCUYfToT4l2M1X"></p>

Then visit http://tet-lab2.tk  and http://tet-lab2.tk  

**http://tet-lab2.tk**
<p align="center"><img src="https://drive.google.com/uc?export=view&id=1vNfOAnmQrVpRPngHF2sGgnyZpobaGcmt"></p>

**http://tet-lab2.tk**
<p align="center"><img src="https://drive.google.com/uc?export=view&id=1ecpdrIqJPNDyYvz8inp-U17PVUMc4qHF"></p>