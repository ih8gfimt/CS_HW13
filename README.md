## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](Images/diagram_filename.png)
https://github.com/ih8gfimt/CS_HW13/blob/master/Diagrams/Unit%2013%20Netwrok%20Diagram.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._
  
  Ans:
  
  pentest.yml
  hosts
  ansible.cfg
  elkplaybook.yml
  filebeat-configuration.yml
  filebeat-playbook.yml
 
This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- _TODO: What aspect of security do load balancers protect? What is the advantage of a jump box?_

Ans:
1. Load balancer is for preventing from denial-of-service (DDoS) attacks
2. Jump box is a gateway router. All the machines have to first send traffic to jumpbox which then forwards traffic to the machines behind it. This allow security administrator to implement strong access controls on the gateway rather then on every individual VM

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the performance and system usage.
- _TODO: What does Filebeat watch for?_

Ans:
1. Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing

- _TODO: What does Metricbeat record?_


The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

Ans:
| Name       | Function                            | IP Address | Operating System |
|------------|-------------------------------------|------------|------------------|
| Jump Box   | Gateway                             | 10.0.0.4   | Linux            |
| DVMA1      | Web App Server                      | 10.0.0.5   | Linux            |
| DVMA2      | Web App Server                      | 10.0.0.6   | Linux            |
| ELK server | Elasticsearch, Logstash, and Kibana | 10.0.0.7   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the ____ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _TODO: Add whitelisted IP addresses_

Ans:
My workstation public IP address:99.13.45.124

Machines within the network can only be accessed by _____.
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_

Ans:
Jump Box ansible container:10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses      |
|----------|---------------------|---------------------------|
| Jump Box | Yes                 | 10.0.0.5 10.0.0.6 10.0.0.7|
|          |                     |                           |
|          |                     |                           |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_

Ans:
Ansible lets user quickly and easily deploy multiple apps. Users list the tasks requied to be done by writing a playbook, and Ansible will figure out how to get systems to the state users want to be in

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._

Ans:
1. install docker.io
2. install python-pip
3. install docker python module
4. increase virtual memory
5. download and launch a docker elk container 



The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

Ans:
root@ELK-Stack:/home/ansible# docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                                                              NAMES
31b27bef61f4        sebp/elk            "/usr/local/bin/star…"   5 days ago          Up 4 minutes        0.0.0.0:5044->5044/tcp, 0.0.0.0:5601->5601/tcp, 0.0.0.0:9200->9200/tcp, 9300/tcp   elk


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_

Ans:
DVMA1:10.0.0.5
DVMA2:10.0.0.6

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_

Ans:
filebeat

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

Ans:
Filebeat Systlog to provide DVMA1 & DVMA2 systemlog events, Systemlog hostnames and process. Sudo commands log to provide system.auth.sudo.command. Sudo commands by user and Sudo errors. SSh logins provide SSH login attempts, Successful SSH logins, SSH users of failed login attempts and SSH login attempts. New users and groups log provide New users, New users by shell, New users over time, New users by home directory, Newgroups and New groups over time

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_

Ans:
1. filebeat-playbook.yml
2. Copy to DVMA1 & DVMA 2 /etc/filebeat/filebeat.yml

- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_

Ans:
/etc/ansible/hosts

[webservers]
10.0.0.5
10.0.0.6

[elkservers]
10.0.0.7



- _Which URL do you navigate to in order to check that the ELK server is running?

Ans:
http:<ELK server public IP>:5601 and check syslog->Module Status

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
