# ff-spring-petclinic

[Firefly](https://github.com/weaveworld/Firefly) test of the [PetClinic](https://github.com/spring-projects/spring-petclinic) Spring example application.

- Test sources are in the app's root folder.

- Example test results are in the [result](result) folder.

## Testing with firefly-desktop 

The easiest way to execute the test is to use the weaveworld/firefly-desktop docker image with the [docker-compose.yml](docker-compose.yml) file.

- Use `git` to have the files:<br>
  `git clone https://github.com/weaveworld/ff-spring-petclinic.git`<br>
  `cd ff-spring-petclinic`
- On Unix, allow to write result files:<br>
  `chmod -R 777 result`

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
    - `Enter` *restarts* the tests
  - At the end of the execution, the results are written out;<br>
    see ([result](result))
- Finally, the application and the firefly-desktop can be stopped<br>
`docker-compose down`    

### Running the tests 

Without the `-i` ('interactive') switch, Firefly runs the tests and stops after them.

- To build and start the PetClinic application, use the following:<br>
`docker-compose -f ff-run.docker-compose.yml up -d petclinic`

- To start the tests, have<br>
`docker-compose -f ff-run.docker-compose.yml run --rm --service-ports firefly-desktop`
  - After the Desktop starts, during the run, the Desktop can be watched:<br>
    http://localhost:7900/vnc_auto.html
  - The execution of the Firefly tests can be watched:<br>
    http://localhost:4444

## Testing with Selenium's standalone images 

Selenium's standalone docker images can also be used with the firefly (not the firefly-desktop) image.

### Testing

- To build the PetClinic application and start with the browsers and with Firefly, use the following:<br>
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

Tests can be run without the `-i` switch.

- To build the PetClinic application and start with the browsers and Firefly, use the following:<br>
`docker-compose -f ff-standalone.docker-compose up -d petclinic firefox chrome edge`
- To run the tests:<br>
  `docker-compose -f ff-standalone-run.docker-compose copy.yml run --rm --service-ports firefly firefly -o /home/app/result -p 7777 BROWSER=chrome@http://chrome:4444 APP_URL=http://petclinic:8080` 
