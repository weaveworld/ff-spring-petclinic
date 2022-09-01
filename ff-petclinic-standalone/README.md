# **Firefly** Testing Spring's *PetClinic* example application with Selenium's standalone docker containers

## Start

First, let's create a network for the test:
  - `docker network create firefly`

### Application

  - To build and start the application, use the following:
    - `docker-compose -f _app.docker-compose.yml up -d --build`
  - After the start, the application can be accessed:<br>http://127.0.0.1:8080/

### Selenium 

  - Let's start the Selenium standalone containers:
    - `docker-compose -f _sel.docker-compose.yml up -d`
  - Containers' desktops can be accessed 
    - Firefox container: http://127.0.0.1:7901/ 
    - Chrome container:  http://127.0.0.1:7902/ 
    - Edge container:    http://127.0.0.1:7903/ 

## Run Test

  - Start the test:
    - `docker-compose run firefly`
    - The result is generated in the [target](../target) folder
    - The test browser can be set changing the [docker-compose.yml](docker-compose.yml) file's `BROWSER` environment variable

  - Default values can be overriden
    - `docker-compose run firefly firefly -o /target -=BROWSER=firefox@http://firefox:4444`
    - `docker-compose run firefly firefly -o /target -=BROWSER=chrome@http://chrome:4444`
    - `docker-compose run firefly firefly -o /target -=BROWSER=edge@http://edge:4444`

  - Selenium containers can be restarted:
    - `docker-compose -f _sel.docker-compose.yml restart`
  


## End

- Shutdown the application:
  - `docker-compose -f _app.docker-compose.yml down`
- Shutdown selenium containers:
  - `docker-compose -f _sel.docker-compose.yml down`


Finally, the test network can be removed:

 - `docker network remove firefly`