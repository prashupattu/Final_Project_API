Feature: Users API

  Background:
    Given the API base URL is "https://jsonplaceholder.typicode.com"

  Scenario: Get all users
    When I send a GET request to "/users"
    Then the response status code should be 200
    And the response should contain 10 items

  Scenario: Get user by valid ID
    When I send a GET request to "/users/1"
    Then the response status code should be 200
    And the field "id" should equal 1

  Scenario: Get user by invalid ID
    When I send a GET request to "/users/9999"
    Then the response status code should be 404

  Scenario: Validate required fields in user object
    When I send a GET request to "/users/1"
    Then the response status code should be 200
    And the field "name" should not be null
    And the field "username" should not be null
    And the field "email" should not be null
