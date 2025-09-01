Feature: Todos API

  Background:
    Given the API base URL is "https://jsonplaceholder.typicode.com"

  Scenario: Get all todos
    When I send a GET request to "/todos"
    Then the response status code should be 200
    And the response should contain 200 items

  Scenario: Get todos by valid ID
    When I send a GET request to "/todos/1"
    Then the response status code should be 200
    And the field "id" should equal 1

  Scenario: Get todos by invalid ID
    When I send a GET request to "/todos/9999"
    Then the response status code should be 404

  Scenario: Validate completed field is boolean
    When I send a GET request to "/todos/1"
    Then the response status code should be 200
    And the field "completed" should equal "false"
