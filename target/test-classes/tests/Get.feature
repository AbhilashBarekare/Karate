Feature: Sample GET API


Background:
* url 'https://reqres.in/api'
* header accept = 'application/json'

#simple get request
Scenario: GET demo 1
Given url 'https://reqres.in/api/users?page=2'
When method GET
Then status 200
And print response
And print responseTime
And print responseHeaders
And print responseStatus

#with background
Scenario: GET demo 2
Given path 'users?page=2'
When method GET
Then status 200
And print response

 #with backgroung, path and params
 Scenario: GET demo 3
Given path '/users'
And param page = 2
When method GET
Then status 200
And print response

#with assertions
 Scenario: GET demo 3
Given path '/users'
And param page = 2
When method GET
Then status 200
And print response
And match response.data[0].first_name != null
And assert response.data.length == 6
And match response.data[1].first_name == 'Lindsay'