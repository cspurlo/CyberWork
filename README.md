# CyberWork
SMU Cybersecurity Project
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/cspurlo/CyberWork/blob/main/images/Week%2013%20-%20Project%20-%20Network%20Diagram.drawio.png (Images/diagram_filename.png)
Diagrams/Week 13 - Project - Network Diagram.drawio.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - filebeat-playbook.yml
  - metricbeat-playbook.yml

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
- What aspect of security do load balancers protect? **The load balancer protects against Distributed Denial of Services attacks.** 
- What is the advantage of a jump box? **A jump box is a server on a network used to access and manage devices in a seperate security zone.**

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the **system resources** and **system files**.
- What does Filebeat watch for? **Filebeat monitors the log files of the servers and forwards the log files to the ELK stack (Elesticsearch) for indexing.**
- What does Metricbeat record? **Metricbeat monitors your servers by collecting metrics from the system and services running on the server.**

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name      | Function       | IP Address | Operating System |
|-----------|----------------|------------|------------------|
| Jump Box  | Gateway        | 10.0.0.4   | Linux            |
| Web-1     | DVWA Container | 10.0.0.5   | Linux            |
| Web-2     | DVWA Container | 10.0.0.6   | Linux            |
| Web-3     | DVWA Container | 10.0.0.7   | Linux            |
| ELK Stack | Monitoring     | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the **Jump-Box** machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- My public IP Address

Machines within the network can only be accessed by the **Jump-Box**.
- _TODO: Which machine did you allow to access your ELK VM? **Jump-Box (container: e0e529cf270e)** What was its IP address? **Jump-Box IP 10.0.0.4 ELK-VM IP 10.1.0.4**

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses        |
|----------|---------------------|-----------------------------|
| Jump-Box | Yes/No              | My Public IP/20.118.202.189 |
| Web-1    | No                  | 10.0.0.4                    |
| Web-2    | No                  | 10.0.0.4                    |
| Web-3    | No                  | 10.0.0.4                    |
| ELK-VM   | Yes/No              | 10.0.0.4/20.127.128.124     |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_**Ansible is capable of deploying software, configuration management, provisioning, etc. to simplify complex tasks to multiple servers simultaneously.**

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
**- Install Docker.io
- Install pip3
- Install Docker Python mmodeule
- Set memory usage vm.max_map_count = 262144
- Download and launch Docker ELK container
	- published ports
		5601:5601
		9200:9200
		5044:5044
- Enable Docker on boot**

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)
![Docker_ps_output](https://user-images.githubusercontent.com/87954650/146693984-6bb4f640-4ee7-4fa7-838a-f7841e937437.PNG)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring
- 10.0.0.5
- 10.0.0.6
- 10.0.0.7

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_
- Succussfully installed filebeats & metricbeats on the following machines
	- Web-1
	- Web-2
	- Web-3

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
	- **Filebeats - collects log events and forwards them to Elesticsearch for indexing. An example of a log would be an unauthorized user attempting to gain access to one of the servers** (**19:09:42.000
system.auth
Connection closed by authenticating user azureuser 10.0.0.4 port 48840 [preauth]**)

	**- Metricbeats - collects metrics from the operating systemand from services running on the server then sends them to Elasticsearch for indexing. An example would be having the ability to monitor resources such as CPU, memory, and network.**

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? **install-elk.yml** Where do you copy it?_**/etc/ansible/install-elk.yml**
- _Which file do you update to make Ansible run the playbook on a specific machine? **The Hosts file** How do I specify which machine to install the ELK server on versus which to install Filebeat on?_ **In the hosts file a line would be included that provides the IP address of the ELK server and command to install ansible. The filebeat-config.yml file would provide the host IP address to install filebeat.**
- _Which URL do you navigate to in order to check that the ELK server is running? http://20.127.92.10:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
**- Download playbook - curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat >> /etc/ansible/filebeat-config.yml**

**- Update files - ansible-playbook filebeat-playbook.yml**
