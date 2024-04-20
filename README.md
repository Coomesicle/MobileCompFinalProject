# GarboTron

### Group Name: Visionary Nexus Hub
Visionary Nexus Hub: the beginnings of humanity's foray into the next world. We aim to connect facets of human life to our technologically advanced counterparts, starting at the humble trash can, intertwining the mundane reality with our exciting future.
### Group Members: Rama Janco, Stephen Coomes, Patrick Nguyen

## Description
GARBOTRON measures how full your garbage can is and sends it to a web dashboard and an LCD screen!

## IOT Device
Our thing utilizes the ultrasonic ranging module connected to our Raspberry Pi. This device allows us to provide stable distance readings with high accuracy. We can detect distances between 2 cm and 450 cm with a precision of up to 3mm. It also utilizes an i2c LCD 1602 screen to display the results.

## Frontend
The frontend of our project is built using HTML, CSS, and JavaScript. Our frontend code is organized into components that encapsulate specific UI elements and functionality, promoting modularity and reusability. We encourage contributions to the frontend codebase and follow best practices for code quality and maintainability. Overall, our frontend aims to deliver a seamless and responsive user experience, powered by robust frontend technologies and practices.
### Dependencies
Open up ```body.html``` to interact with our Frontend. (Make sure the API is running)
### Features
- *Get Percent* Using Restful API protocols, this button seemlessly calls the api to return the data in json format to allow the user to see the percent distance in relative to the max distance.
- *Get Distance* Using Restful API protocols, this button seemlessly calls the api to return the data in json format to allow the user to see the distance of the actuator from the sensor.
- *Garbotron Info* Retrieves all the device information on the Garbotron, in the DDL model. Returns in JSON and displays on HTML.

## API
The API is built in python using flask and follows REST protocols, the API facilitates communication between the frontend and backend and 3 different endpoints.

### Dependencies
This requires python to be already installed on your system.
Inside the **api** directory, install flask and CORS using ```pip install -U Flask``` and ```pip install -U flask-cors```. Then the API can be run using ```python main.py```. The API is hosted on localhost (5000), and its methods can be accessed accordingly. 
Text Stephen if you have any questions/concerns!

### Features
Endpoints:
- ```\garbotron\```  Uses a GET request to get Device information
- ```\garbotron\distance\``` Uses a GET request to get the distance of the actuator from the sensor, can be updated with PUT.
- ```\garbotron\percent\``` Uses a GET request to get the percent of max disatance, can be updated with PUT.

## Atlas Middleware


