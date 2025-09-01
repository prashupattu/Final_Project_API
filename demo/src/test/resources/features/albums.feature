Feature: Albums API

  Background:
    Given the API base URL is "https://jsonplaceholder.typicode.com"

  Scenario: Get all albums
    When I send a GET request to "/albums"
    Then the response status code should be 200
    And the response should contain 100 items

  Scenario: Get album by valid ID
    When I send a GET request to "/albums/1"
    Then the response status code should be 200
    And the field "id" should equal 1

  Scenario: Get album by invalid ID
    When I send a GET request to "/albums/9999"
    Then the response status code should be 404
