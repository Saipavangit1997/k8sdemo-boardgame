# BoardgameListingWebApp

## Description

**Board Game Database Full-Stack Web Application.**
This web application displays lists of board games and their reviews. While anyone can view the board game lists and reviews, they are required to log in to add/ edit the board games and their reviews. The 'users' have the authority to add board games to the list and add reviews, and the 'managers' have the authority to edit/ delete the reviews on top of the authorities of users.  

## Technologies

- Java
- Spring Boot
- Amazon Web Services(AWS) EC2
- Thymeleaf
- Thymeleaf Fragments
- HTML5
- CSS
- JavaScript
- Spring MVC
- JDBC
- H2 Database Engine (In-memory)
- JUnit test framework
- Spring Security
- Twitter Bootstrap
- Maven

## Features

- Full-Stack Application
- UI components created with Thymeleaf and styled with Twitter Bootstrap
- Authentication and authorization using Spring Security
  - Authentication by allowing the users to authenticate with a username and password
  - Authorization by granting different permissions based on the roles (non-members, users, and managers)
- Different roles (non-members, users, and managers) with varying levels of permissions
  - Non-members only can see the boardgame lists and reviews
  - Users can add board games and write reviews
  - Managers can edit and delete the reviews
- Deployed the application on AWS EC2
- JUnit test framework for unit testing
- Spring MVC best practices to segregate views, controllers, and database packages
- JDBC for database connectivity and interaction
- CRUD (Create, Read, Update, Delete) operations for managing data in the database
- Schema.sql file to customize the schema and input initial data
- Thymeleaf Fragments to reduce redundancy of repeating HTML elements (head, footer, navigation)

## How to Run

1. Clone the repository
2. Open the project in your IDE of choice
3. Run the application
4. To use initial user data, use the following credentials.
  - username: bugs    |     password: bunny (user role)
  - username: daffy   |     password: duck  (manager role)
5. You can also sign-up as a new user and customize your role to play with the application! 😊

## Project Setup:

1. Create a Azure Kubernetes cluster in azure portal and create a separate server for Sonarqube and Nexus in the same vnet of AKS.
2. Login to the AKS from the server with below commands. <br>
     - ssh -i ssh_keypair.pem azureuser@123.456.789.101 <br>
    i. Install Azure cli <br>
       - az login --tenant TENANT_ID <br>
    ii. Use below commands to connect azure AKS from server <br>
       - az account set --subscription SUBSCRIPTION-ID <br>
       - az aks get-credentials --resource-group RG_NAME --name CLUSTER_NAME <br>
    iii. Use kubectl commands to testing. <br>
       - kubectl get nodes <BR> 
3. Commands to install sonarqube and Nexus <br>
    SonarQube: <br>
    - docker volume create sonarqube_data <br>
    - docker run -d --name sonarqube-custom -p 9000:9000 -v sonarqube_data:/opt/sonarqube/data sonarqube:community <br>
   Nexus: <br>
    - docker volume create nexus-data <br>
    - docker run -d -p 8081:8081 --name nexus -v nexus-data:/nexus-data sonatype/nexus3 <br> 
    - cat /nexus-data/admin.password  --> For nexus password <br>
4. Now add the Nexus dependencies in pom.xml and settings.xml for Nexus authentication.
5. Prepare a Azure pipeline yaml
6. Run the pipeline.

## Monitoring Setup

1. Install Helm in ubuntu server.
2. Add the below helm repo <br>
   - helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
3. helm repo update
4. kubectl create ns prom
4. helm install prometheus prometheus-community/kube-prometheus-stack -n prom -f prometheus-values.yaml 
5. Now, Access the Garfana and prometheus using public ips of Azure load balancer.
6. Configure the prometheus in Grafana as datasource and create a Dashboard to view the metrics.

