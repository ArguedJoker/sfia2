# SFIA-2

## QA Academy

### Cloud Native Engineer (DevOps) Learning Path

<h3 align="center">
Automation Project
</h3>

<p>This is project is to show the ability to automate a simple [Flask application](https://flask.palletsprojects.com/en/1.1.x/quickstart/#a-minimal-application), ready to be deployed, for the SFIA2 project.

## Contents

* [Acknowledgements](#Acknowledgements)
* [Resources](#Resources)
* [Licensing & versioning](#licensing-&-Versioning)
* [Brief](#Brief)
    * [Project Scope (Additional Requirements)](#Project-Scope-(Additional-Requirements))
* [Technologies](#Technologies)
* [Architecture](#Architecture)  
* [Project Tracking](#Project-Tracking)
* [User Story](#User-Stories)
    * [What makes a User Story?](#so-what-makes-a-user-story)
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

## Resources

Donald Pump image from bodybuilding_humour

## Licensing & Versioning

Version 1.0.1a

## Brief

The brief provided for the project sets the following out as the overall objective:

[Back to Contents](#Contents)
## Project Scope (Additional Requirements)

The minimum requirements for the project were as follows:

[Back to Contents](#Contents)

## Technologies

The following project constraints are as follows in the table:

<details>

| Technology | Use     |
| ---------- |---------|
| Jira       | Kanban board, Task Management / Tracking|
| GCP Managed SQL Server| Database|
| Java | Programming Language, Back-end |
| HTML | Markup Language, Front-End|
| CSS | Styling Sheet Language, Front-end|
| JavaScript | Scripting Language, Front-end|
| JUnit & Mockito | Unit Testing |
| Selenium | Integration Testing |
| Git | Version Control |
| CircleCI | CI Server |
| GCP Virtual Machine | Cloud Server |

</details>

[Back to Contents](#Contents)

## Architecture

[Back to Contents](#Contents)

## Project Tracking

<p align="center">
    <img width="600" height="400" src="">
</p>

Jira is a useful tool that was selected as it supports roadmapping requirements. It empowers the user to sketch out the big picture, communicate plans and enables to connect the overarching bigger roadmap goals between each individual and team to deadlines and daily tasks. It is great for Agile Methodologies and can be integrated with other applications such as teams for easier monitoring of progress which shows just how customisable it can be. This flexibility is probably its largest positive feature as different approaches can be accommodated and companies can still work in a positive and efficient manner.
My first sprint was very successful as I was able to complete all of my tasks such as completing the risk assessment and I was able spend more time on learning Java.  The second sprint lasted 2 weeks in which I have done a lot of coding of the application and have managed to complete the crud logic functionality on the backend. I am still currently in the process of making CRUD functionality available on the frontend, though I have been successful in create, read and delete functionality.

[Back to Contents](#Contents)

## User Stories



 ### So what makes a User Story?

 

<p align="center">
    <img width="300" height="350" src="https://qa-courseware-images.s3.eu-west-2.amazonaws.com/agile/product-backlog-items/000.png" alt="mind map showing the one to many relationship between Epics, stories and tasks are related"/>
</p>

## My Approach

In order to achieve this I decided on producing an application on a subject rather topical in the current economic climate and rather close to my heart in the following introduction:

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

|Must Have | Should Have | Could Have | Won't Have |
|----------|-------------|------------|------------|
| CRUD functionality | Log-in  functionality | aesthetic Front-End Design | Using quote generator to create fun inspirational quotes each time user logs in      | 
|          |             | Inspirational Quote Generator | |

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

Once the frontend and the backend are completed and linked together, deep testing would be required to ensure the functionality of both aspects of the application.
Testing will be carried out using Junit and Selenium in two replicable ways as shown below.

## pyesting


[Back to Contents](#Contents)



## Known Issues


[Back to Contents](#Contents)

## Future Improvements & possible features


## Long Term Improvements


[Back to Contents](#Contents)

## Author

Rohan Chauhan