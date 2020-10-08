# SFIA-2

## QA Academy

### Cloud Native Engineer (DevOps) Learning Path

<h3 align="center">
Automation Project
</h3>

<p>This is project is to show the ability to automate a simple [Flask application](https://flask.palletsprojects.com/en/1.1.x/quickstart/#a-minimal-application), ready to be deployed, for the SFIA2 project.

## Contents

* [Acknowledgements](#Acknowledgements)
* [Licensing & versioning](#licensing-&-Versioning)
* [Brief](#Brief)
    * [Project Scope (Additional Requirements)](#Project-Scope-(Additional-Requirements))
* [Technologies](#Technologies)
* [Architecture](#Architecture)  
* [Project Tracking](#Project-Tracking)
* [My Approach](#My-Approach)
    * [Project Introduction](#Project-Introduction)
    * [MoSCoW Analysis](#MOSCOW-Analysis)
    * [Risk Assessment](#Risk-Assessment)
    * [Security](#Security)
    * [Testing](#Testing)
        * [pytest](#Pytest)
* [Known Issues](#Known-Issues)
* [Future Improvements & possible Features](#Future-Improvements-&-possible-features)
    * [Long Term Improvements](#Long-Term-Improvements)
        * [Security](#Security)* 
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

[Back to Contents](#Contents)
## Project Scope (Additional Requirements)

The project involved the following concepts:

* Continuous Integeration
* Containerisation
* Configuration Management
* Cloud Solutions
* Infrastructure Management
* Orchestration

A Jira board was to be used to help perform task management and project planning. This would serve to provide a record of any issues that were faced creating the project. 

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

[Back to Contents](#Contents)

## Architecture

![mvp-diagram](https://i.imgur.com/i5qfOas.png)

The picture above demonstrates how the MVP should be working at a high level. Terraform should spin up some virtual machines for Jenkins, the Testing Database and Production Database. Ansible a powerful tool for automation would then install and configure Jenkins with a user in the virtual machine through ansible-playbooks. When the codebase is edited in the development branch, Jenkins would detect this through Webhooks and would push this to the testing environment where the python application would then have to pass unit tests made by pytests. Once passed, the automation would continue and merge the Development branch to master which would be detected by Jenkins. The CI pipeline would then push the build from master to the production environment. The user would be able to see the frontend of the application on port 80 because of reverse proxy that was enabled by NGINX.

[Back to Contents](#Contents)

## Project Tracking

<p align="center">
    <img width="600" height="400" src="">
</p>

Jira is a useful tool that was selected as it supports roadmapping requirements. It empowers the user to sketch out the big picture, communicate plans and enables to connect the overarching bigger roadmap goals between each individual and team to deadlines and daily tasks. It is great for Agile Methodologies and can be integrated with other applications such as teams for easier monitoring of progress which shows just how customisable it can be. This flexibility is probably its largest positive feature as different approaches can be accommodated and companies can still work in a positive and efficient manner.
My first sprint was very successful as I was able to complete all of my tasks such as completing the risk assessment and I was able spend more time on learning Java.  The second sprint lasted 2 weeks in which I have done a lot of coding of the application and have managed to complete the crud logic functionality on the backend. I am still currently in the process of making CRUD functionality available on the frontend, though I have been successful in create, read and delete functionality.

[Back to Contents](#Contents)

## My Approach



[Back to Contents](#Contents)

### Project Introduction
<details>

</details>

[Back to Contents](#Contents)

## MOSCOW Analysis

The MoSCow Analysis is a technique that is very commonly used in management, particularly in project management and software development.  In short, this principle effectively provides perspective and focus on managing expectations within a project. It is a useful tool when communicating with stakeholders about what elements of the project should have priority and what parts should be re-evaluated. It is usually used in conjunction with timeboxing  and is commonly used in agile software development approaches like Scrum.

MoSCoW itself is an acronym where the capital letters are all derived from the four categories of prioritization:

* Must have - priorities that are critical to the success of the deadline
* Should have - priorities that are important for the product but not necessary for the current deadline
* Could have - priorities that are desirable but not necessary. Usually this would tend to be UI/UX improvements and are typically included if time and resources permit.
* Won't have - time to carry out these priorities for the current deadline and have been agreed upon and will usually be re-evaluated.

| Must Have                                             | Should Have                                            | Could Have | Won't Have |
|-------------------------------------------------------|--------------------------------------------------------|------------|------------|
| Containerisation tools to deploy application          | Pytest must be put in document for reading             | Terraform and Ansible to configure test VM           |            | 
| Orchestration tools to deploy application             |                                                        | Terraform to configure the Kubernetes Cluster           |            |
| Two managed Database Servers (testing and production) |                                                        |            |            |
| Webhooks so that Jenkins recreates and redeploys      |                                                        |            |            |
| Ansible Playbook to provision the CI server           |                                                        |            |            |
| NGINX to make sue of reverse proxy                    |                                                        |            |            |

[Back to Contents](#Contents)

## Risk Assessment

Before any work on the project is under way, it is important to assess the various risks that can affect successful completion. In the analysis I have included various risks that could affect each stage of the project ranging from SQL injections through to the likelihood of the risk and the impact.

[link to google sheets for Risk Assessment]

##### Definition 
Key

|            | Low                    | Medium                                                                            | High                                                                                                    |
|------------|------------------------|-----------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| Likelihood | unlikely risk to occur | risk likely to occur but current measurements are enough to mitigate consequences | very likely to occur and the current resources and measurements are not enough. Further action required |
| Impact     | measurements in place are effective and lost resources can be covered | the risk that occurs does not lead to major malfunctions of the application or loss of data   | the consequence of inaction will lead to site malfunction and or inaccessibility and thus loss of user base |

Risk Tolerance would dictate whether action would need to be taken or if the current measurements in place were enough to manage the perceived or current risk (Tolerate) or not and further action needed to be taken (Treat).
                 
[Back to Contents](#Contents)

## Testing

### pyesting


[Back to Contents](#Contents)



## Known Issues


[Back to Contents](#Contents)

## Future Improvements & possible features


## Long Term Improvements


[Back to Contents](#Contents)

## Author

Rohan Chauhan