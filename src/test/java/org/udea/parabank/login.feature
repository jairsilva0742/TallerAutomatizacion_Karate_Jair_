@appcontact_login
Feature: Login to app contact
 
  Background:
    * url baseUrl   
    * header Accept = 'application/json'
   
  Scenario: Login exitoso con credenciales válidas
    Given path '/users/login'
    And request { "email": "PruebaSoftware3@gmail.com", "password": "123456789" }
    When method POST
    Then status 200
    And match response.token == '#present'
    And def authToken = response.token
  
    Given path '/contacts'
    And header Authorization = 'Bearer ' + authToken
    When method GET
    Then status 200 

  Scenario: Login con credenciales inválidas
    Given path '/users/login'
    And request { "email": "usuario1@prueba.com", "password": "123456789" }
    When method POST
    Then status 401

  Scenario: Login con email malformado
    Given path '/users/login'
    And request { "email": "emailInvalido", "password": "123456789" }
    When method POST
    Then status 401

  Scenario: Login con campos vacíos
    Given path '/users/login'
    And request { "email": "", "password": "" }
    When method POST
    Then status 401
