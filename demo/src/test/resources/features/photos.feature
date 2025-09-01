Feature: Photos API

  Background:
    Given the API base URL is "https://jsonplaceholder.typicode.com"

  Scenario: Get all photos
    When I send a GET request to "/photos"
    Then the response status code should be 200
    And the response should contain 5000 items

  Scenario: Get photos by valid albumId
    When I send a GET request to "/photos?albumId=1"
    Then the response status code should be 200
    And every item should have "albumId" equal to 1

  Scenario: Get photos by invalid albumId
    When I send a GET request to "/photos?albumId=9999"
    Then the response status code should be 200
    And the response should contain 0 items
