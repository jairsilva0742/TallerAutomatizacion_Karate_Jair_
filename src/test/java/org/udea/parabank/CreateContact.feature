@appcontact_createcontact
Feature: create contact to app contact

  Background:
    * url baseUrl
    * header Accept = 'application/json'
Scenario: Login y crear contacto
  # Login
  Given path '/users/login'
  And request { "email": "PuebaSoftware@gmail.com", "password": "123456789" }
  When method POST
  Then status 200
  * def authToken = response.token

  # Crear contacto
  Given path '/contacts'
  And header Authorization = 'Bearer ' + authToken
  And request { "firstName": "Jair", "lastName": "Herrera", "birthdate": "1990-10-01", "email": "JairHerrera@fake.com", "phone": "8005555555", "street1": "1 Main St.", "street2": "Apartment A", "city": "Anytown", "stateProvince": "KS", "postalCode": "12345", "country": "USA" }
  When method POST
  Then status 201

  Scenario: Crear contacto con campos faltantes
    Given path '/users/login'
    And request { "email": "pruebasleo@hotmail.com", "password": "12345678" }
    When method POST
    Then status 200
    * def authToken = response.token

    Given path '/contacts'
    And header Authorization = 'Bearer ' + authToken
    And request { "lastName": "SinNombre" }
    When method POST
    Then status 400
