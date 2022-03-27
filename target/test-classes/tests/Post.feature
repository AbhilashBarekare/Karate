Feature: Post requests

  Background: 
    * url 'https://reqres.in/api'
    * header accept = "application.jason"
    * def expectedOutput = read('response1.json')

  #simple post call
  Scenario: Demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "Test1","job": "leader"}
    When method POST
    Then status 201
    And print response

  #with bckground
  Scenario: Demo 2
    Given path '/users'
    And request {"name": "Test1","job": "leader"}
    When method POST
    Then status 201
    And print response

  #with assertions
  Scenario: Demo 3
    Given path '/users'
    And request {"name": "Test1","job": "leader"}
    When method POST
    Then status 201
    And print response
    And match response == {"name": "Test1", "job": "leader", "id": "#string", "createdAt": "#ignore"}

  #with reading respose from a file
  Scenario: Demo 4
    Given path '/users'
    And request {"name": "Test1","job": "leader"}
    When method POST
    Then status 201
    And print response
    And match response == expectedOutput
    
  #with request body in a file
     Scenario: Demo 5	
    Given path '/users'
    And def requestBody = read('request1.json')
    And request  requestBody
    When method POST
    Then status 201
    And print response
    And match response == expectedOutput
    
  #if file is in different location
   Scenario: Demo 6
    Given path '/users'
    And def projectpath = karate.properties['user.dir']
    And def filePath = projectpath+'src/test/java/tests/request1.json'
    And request  filePath
    When method POST
    Then status 201
    And print response
    And match response == expectedOutput
    
    #post with file and update keys in script
   Scenario: Demo 7
    Given path '/users'
    And def requestBody = read('request1.json')
  	And set requestBody.job = 'teacher'
    And request  requestBody
    When method POST
    Then status 201
    And print response
    And match response == expectedOutput 
    
    
