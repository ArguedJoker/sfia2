# SFIA-2

## QA Academy

### Cloud Native Engineer (DevOps) Learning Path

<h3 align="center">
Automation Project
</h3>

<p>This is project is to show the ability to automate a simple Flask Application, ready to be deployed, for the SFIA2 project.

## Contents

* [Acknowledgements](#Acknowledgements)
* [Licensing & versioning](#Licensing-&-Versioning)
* [Brief](#Brief)
    * [Project Scope](#Project-Scope)
* [Technologies](#Technologies)
* [Architecture](#Architecture)  
* [My Approach](#My-Approach)
    * [Project Introduction](#Project-Introduction)
    * [Project Tracking](#Project-Tracking)
    * [MoSCoW Analysis](#MOSCOW-Analysis)
    * [Risk Assessment](#Risk-Assessment)
    * [Testing](#Testing)
        * [Pytesting](#Pytesting)
* [Known Issues Faced](#Known-Issues-Faced)
* [Future Improvements](#Future-Improvements)
* [Author](#Author)




## Acknowledgements

Acknowledgements go to:
 
 * QA Academy
 * Jay Grindrod (Learning Specialist)
  
  All of whom without I would not have amassed the knowledge, nor the skill-set to have made this project come to life.

## Licensing & Versioning

Version 1.0.1a

## Brief

The brief provided for the project sets the following out as the overall objective:

* to be deployed to a Virtual Machine for testing purposes
* be deployed in a managed Kubernetes Cluster for production purposes
* make use of a managed Database solution

Please look at the [Project-Brief.md](https://github.com/ArguedJoker/sfia2/blob/developments/Project-Brief.md) for more information

[Back to Contents](#Contents)
## Project Scope (Additional Requirements)

The project involved the following concepts:

* Continuous Integeration
* Containerisation
* Configuration Management
* Cloud Solutions
* Infrastructure Management
* Orchestration

With the idea of a minimum viable project (MVP):

* the application had to be deployed using containerisation and orchestration tools such as docker and kubernetes and Jenkins to provide the CI pipeline that would enable testing on the application. 
* The project had to make sue of two managed Database Servers - one for testing and the other for production. 
* Ansible would be used to provision the environment that the CI server would need to run and make use of NGINX of a reverse proxy so that the application was accessible to the user. 
* If a change is made to the code base, webhooks should be used so that Jenkins would recreate and redeploy the changed applications.


[Back to Contents](#Contents)

## Technologies

* Kanban Board: Jira
* Version Control: Git
* CI Server: Jenkins
* Configuration Management: Ansible
* Cloud Server: AWS EC2
* Database Server: AWS RDS
* Containerisation: Docker
* Reverse Proxy: NGINX
* Orchestration Tool: Kubernetes
* Infrastructure Management: Terraform

<details>
## Jira

Jira is a useful tool that was selected as it supports roadmapping requirements. It empowers the user to sketch out the big picture, communicate plans and enables to connect the overarching bigger roadmap goals between each individual and team to deadlines and daily tasks. It is great for Agile Methodologies and can be integrated with other applications such as teams for easier monitoring of progress which shows just how customisable it can be. This flexibility is probably its largest positive feature as different approaches can be accommodated and companies can still work in a positive and efficient manner. A Jira board was to be used to help perform task management and project planning. This would serve to provide a record of any issues that were faced creating the project.

For more information: https://www.atlassian.com/software/jira/features

## Git 

Git is a distributed Version Control System where developers can put their code into repositories. Github holds these repositories. 

For more information: https://git-scm.com/

## Jenkins

Is a free open source automation server. It helps to automate the all the monotonous parts of software development that pertain to building, testing and deploying. It is crucial for the continous integration and continuous delivery for this project. One of the best features is the use of webhooks to trigger builds. For example, a webhook can be triggered upon pushed commits to github.

For more information: https://en.wikipedia.org/wiki/Jenkins_(software)

## Ansible

Another open-source software that is useful for provisioning, configuration management, and application-deployment tool. It can run on and configure many unix like systems and windows. It utilises YAML language which is used to write ansible playbooks. It is extremely powerful because it can spin up many hundereds of nodes at any time because Ansible itself is agentless. This means that its operations only push out only what nodes need to see. It uses SSH to push changes from a single source to multiple remote resources for linus and unix machines.

For more information: https://www.ansible.com/

## AWS EC2

Amazon Web Service Elastic Compute 2 is a web service that is designed to make web-scale cloud computing much, much easier for developers. The project utilises this service to create EC2 instances.

For more information: https://aws.amazon.com/ec2/?ec2-whats-new.sort-by=item.additionalFields.postDateTime&ec2-whats-new.sort-order=desc

## AWS RDS

Amazon Relational Database Service is a technology that allows for cost-efficient database in the cloud that is easy to set up. The project utilises two AWS RDS instances.

For more information: https://aws.amazon.com/rds/

## Docker

An open-source containerisation tool, docker is a useful solution for differing system enviorments, providing the ability to keep environments consistent. In the project Docker is used to build and create images which can be sent to dockerhub.

For more information: https://www.docker.com/

## NGINX

This is a web server that is used as a reverse proxy, load balancer and many other things. In the project it will handle and process all requests before sending them to the corresponding application server acting as a load balancer.

For more information: https://www.nginx.com/

## Kubernetes

Also known as K8 is another example of open-source technology for automating deployments of containerised application. One of the benefits of this technology is that it is possible to dictate the desired state of the cluster. Once configures Kubernetes will automatically configure the containersin the cluster to the desired state.

For more information: https://kubernetes.io/

## Terraform

THis is a solution aloows you to control the infrastructure on a cloud service provider. In this project Terraform will be controlling AWS. This will allow for Infrastructure as code where we can use high level programming languages to be able to describe and manage the infrastructure. This also means that infrastructure configurations can be versioned and maintained. Thus if another environment needs to be created, the configurations will be up to date.

For more information: https://www.terraform.io/

</details>

[Back to Contents](#Contents)

## Architecture

![mvp-diagram](https://i.imgur.com/i5qfOas.png)

The picture above demonstrates how the MVP should be working at a high level. Terraform should spin up some virtual machines for Jenkins, the Testing Database and Production Database. Ansible a powerful tool for automation would then install and configure Jenkins with a user in the virtual machine through ansible-playbooks. When the codebase is edited in the development branch, Jenkins would detect this through Webhooks and would push this to the testing environment where the python application would then have to pass unit tests made by pytests. Once passed, the automation would continue and merge the Development branch to master which would be detected by Jenkins. The CI pipeline would then push the build from master to the production environment. The user would be able to see the frontend of the application on port 80 because of reverse proxy that was enabled by NGINX.

[Back to Contents](#Contents)

## My Approach

### Project Introduction

To start off I had to plan how I wanted to approach the project requirements and this meant a lot of background reading into the various technologies. Once I had established a basic fundamental knowledge of the technologies, I was then able to have a clear picture of how they related to each other and thus how I should start to plan my project. Over the course of my sprints, the documentation became more detailed as I became more proficient with the technologies and increased my knowledge base.

(Any issues I faced will be mentioned in the Known Issues Faced section)

[Back to Contents](#Contents)

## Project Tracking

* My first sprint was very successful as I was able to complete all of my tasks at the time such as completing the risk assessment and I was able spend more time on learning the new technologies.  

<p align="center">
    <img width="600" height="400" src="/images/Sprint1.png">
</p>

* The second sprint was equally successful where I was able to write a lot of the architecture code and managed to set up docker, docker-compose and have Jenkins working with webhooks. At this time I was mainly using Google Cloud Platform to practice this.

<p align="center">
    <img width="600" height="400" src="/images/Jenkins-Builds.png">
</p>

* The third sprint was focused on the transferring all the code to AWS and to utilise Ansible, Terraform and Kubernetes. 

<p align="center">
    <img width="600" height="400" src="/images/sprint2.png">
</p>

[Back to Contents](#Contents)

### MOSCOW Analysis

The MoSCow Analysis is a technique that is very commonly used in management, particularly in project management and software development.  In short, this principle effectively provides perspective and focus on managing expectations within a project. It is a useful tool when communicating with stakeholders about what elements of the project should have priority and what parts should be re-evaluated. It is usually used in conjunction with timeboxing  and is commonly used in agile software development approaches like Scrum.

MoSCoW itself is an acronym where the capital letters are all derived from the four categories of prioritization:

* Must have - priorities that are critical to the success of the deadline
* Should have - priorities that are important for the product but not necessary for the current deadline
* Could have - priorities that are desirable but not necessary. Usually this would tend to be UI/UX improvements and are typically included if time and resources permit.
* Won't have - time to carry out these priorities for the current deadline and have been agreed upon and will usually be re-evaluated.

| Must Have                                             | Should Have                                            | Could Have | Won't Have |
|-------------------------------------------------------|--------------------------------------------------------|------------|------------|
| Containerisation tools to deploy application          | Pytest must be put in document for reading             |           |     Terraform and Ansible to configure test VM        | 
| Orchestration tools to deploy application             |                                                        |            |    Terraform to configure the Kubernetes Cluster        |
| Two managed Database Servers (testing and production) |                                                        |            |            |
| Webhooks so that Jenkins recreates and redeploys      |                                                        |            |            |
| Ansible Playbook to provision the CI server           |                                                        |            |            |
| NGINX to make sue of reverse proxy                    |                                                        |            |            |

[Back to Contents](#Contents)

## Risk Assessment

Before any work on the project is under way, it is important to assess the various risks that can affect successful completion. In the analysis I have included various risks that could affect each stage of the project ranging from SQL injections through to the likelihood of the risk and the impact.

https://docs.google.com/spreadsheets/d/1t2-prSWoazSUeYOM_edqfVvreSCfYGyaql9sTPWwUKw/edit#gid=0

Note that the excel sheet has been added as additional information.

##### Definition 

Key

|            | Low                    | Medium                                                                            | High                                                                                                    |
|------------|------------------------|-----------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| Likelihood | unlikely risk to occur | risk likely to occur but current measurements are enough to mitigate consequences | very likely to occur and the current resources and measurements are not enough. Further action required |
| Impact     | measurements in place are effective and lost resources can be covered | the risk that occurs does not lead to major malfunctions of the application or loss of data   | the consequence of inaction will lead to site malfunction and or inaccessibility and thus loss of user base |

Risk Tolerance would dictate whether action would need to be taken or if the current measurements in place were enough to manage the perceived or current risk (Tolerate) or not and further action needed to be taken (Treat).
                 
[Back to Contents](#Contents)

## Testing

### Pytesting

Unit Testing is very important for any application creation. It is used to test small components (or units) within the application in controlled environments. In the project Pytest is used to execute the unit testing and the resulting information (frontend and backend) is cat into respective txt files.

<p align="center">
    <img width="600" height="400" src="/images/frontendpytest.png">
</p>

Results for the frontend pytest

<p align="center">
    <img width="600" height="400" src="/images/backendpytest.png">
</p>

Results for the backend pytest

[Back to Contents](#Contents)

## Known Issues Faced

* Whilst leasrning with GCP, I did come across a lot of host verification errors or permission errors. This is because of the security feature in GCP VMs which will forget the public key after a certain amount of time. I would have to put the public key back into the authorized key in the appropriate VM. This was particularly infuriating when testing for Jenkins and was a large part of the reason why I decided on making the switch to AWS as it is more mature, with better documentation.

[Back to Contents](#Contents)

## Future Improvements

* Using Terraform to configure the Kubernetes Cluster for production
* Using Terrafrom and Ansible to configure the Test VM

[Back to Contents](#Contents)

## Author

Rohan Chauhan