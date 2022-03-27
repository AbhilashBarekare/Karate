Feature: using karate.config file

Background:
* url baseURL
* header accept = 'application/json'

#simple get request
Scenario: GET demo 1
Given path '/users?page=2'
When method GET
Then status 200
And print response