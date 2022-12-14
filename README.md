# ff-spring-petclinic

[Firefly](https://github.com/weaveworld/Firefly) test of the [PetClinic](https://github.com/spring-projects/spring-petclinic) Spring example application.

- Test sources are in the app's root folder.

- Example test results are in the [result](result) folder.

[<img src="_resource/ff-petclinic.gif" alt="Click to see the video" width="500"></img>](https://youtu.be/p40boQzXK64)

See the [*video*](https://youtu.be/p40boQzXK64) about the steps.

## Testing with firefly-desktop

The easiest way to execute the test is to use the weaveworld/firefly-desktop docker image with the [docker-compose.yml](docker-compose.yml) file.

- Use `git` to have the files:<br>
  `git clone https://github.com/weaveworld/ff-spring-petclinic.git`<br>
  `cd ff-spring-petclinic`

### Testing

- To build the PetClinic application, use the following:<br>
`docker-compose build`

- Start the application and the weaveworld/firefly-desktop environment:<br>
`docker-compose up -d`
  - check the desktop:<br>
    http://localhost:7900/vnc_auto.html
  - visit the application:<br>
    http://localhost:8080
  - open the tests in the browser:<br>
    http://localhost:7777
    - Press `Enter` to **start** the test
    - Press `Escape` to **break** the execution
    - Make changes in the sources
    - Press `Backspace` to **reload** the sources
      - `Enter`to *restarts* the tests
    - At the end of the execution, the results are written out;<br>
    see ([result](result))
      - Using [jq](https://stedolan.github.io/jq/), a summary can be get:<br>
        `tail +2 result/index.firefly.js | jq '.|{state,success,warning,error,t}'`
- Finally, the application and the firefly-desktop can be stopped<br>
`docker-compose down`

- Browser links:
  - `BROWSER=firefox@http://localhost:4444`
  - `BROWSER=chrome@http://localhost:4444`
  - `BROWSER=edge@http://localhost:4444`

### Running the tests

Without the `-i` ('interactive') switch, Firefly runs the tests and stops after them.

- To build and start the PetClinic application, use the following:<br>
  `docker-compose up -d petclinic`

- To start the tests, have<br>
  `docker-compose run --rm --service-ports firefly-desktop BROWSER=chrome@http://localhost:4444`
  - During the run the Desktop can be watched:<br>
    http://localhost:7900/vnc_auto.html
  - Firefly test execution can be watched:<br>
    http://localhost:7777
- To stop the application use<br>
  `docker-compose down`

## Testing with Selenium's standalone images

[Selenium's standalone docker images](https://github.com/SeleniumHQ/docker-selenium#standalone) can also be used with the weaveworld/firefly (not the weaveworld/firefly-desktop) image.

### Testing

- To build the PetClinic application and start with the browsers and Firefly, use the following:<br>
`docker-compose -f ff-standalone.docker-compose up -d`
  - Desktop access:
      - Firefox container: http://localhost:7901/
      - Chrome container:  http://localhost:7902/
      - Edge container:    http://localhost:7903/
  - Firefly can be controlled from its web page (Enter, Backspace, etc.):<br>
    http://localhost:7777
  - Browser links:
    - `BROWSER=firefox@http://firefox:4444`
    - `BROWSER=chrome@http://chrome:4444`
    - `BROWSER=edge@http://edge:4444`

### Running the tests

- To build the PetClinic application and start with the browsers, use the following:<br>
  `docker-compose -f ff-standalone.docker-compose up -d petclinic firefox chrome edge`

- To start the tests, have<br>
  `docker-compose -f ff-standalone.docker-compose run --rm --service-ports firefly-desktop BROWSER=chrome@http://localhost:4444`
  - During the run, the Desktop can be watched:<br>
    http://localhost:7900/vnc_auto.html
  - The execution of the Firefly tests can be watched:<br>
    http://localhost:7777
- To stop use<br>
  `docker-compose down`

## Testing with weaveworld/selenium docker image

The [weaveworld/selenium](https://github.com/weaveworld/ubuntu-desktop#selenium-weaveworldselenium) docker image contains the Firefox, Chrome and Edge browsers, with the Selenium drivers and the Selenium Server, that are accessible using the RemoteWebDriver.

### Testing

- To build the PetClinic application and start with the browsers and with Firefly, use the following:<br>
`docker-compose -f ff-selenium.docker-compose up -d`
  - Desktop access: <br>
    http://localhost:7900
  - Firefly can be controlled from its web page (Enter, Backspace, etc.):<br>
    http://localhost:7777
  - Browser links:
    - `BROWSER=firefox@http://selenium:4444`
    - `BROWSER=chrome@http://selenium:4444`
    - `BROWSER=edge@http://selenium:4444`

### Running the tests

- To build the PetClinic application and start with the browsers, use the following:<br>
  `docker-compose -f ff-selenium.docker-compose up -d petclinic selenium`

- To start the tests have<br>
  `docker-compose -f ff-selenium.docker-compose run --rm --service-ports firefly-desktop BROWSER=chrome@http://localhost:4444`
  - During the run, the Desktop can be watched:<br>
    http://localhost:7900/vnc_auto.html
  - The execution of the Firefly tests can be watched:<br>
    http://localhost:7777
- To stop the environment use:<br>
  `docker-compose down`