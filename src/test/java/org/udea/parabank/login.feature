@appcontact_login
Feature: Login to Parabank

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Customer Login
    Given path '/users/login'
    And path 'john' //userName
    And path 'demo' //password
    When method GET
    Then status 200
    And match response ==
    """
{
    "user": {
        "_id": "#number",
        "firstName": "#string",
        "lastName": "#string",
        "email": "#string",
        "__v": "#number",
    },
    "token": "#string"
}
    """
