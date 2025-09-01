Feature: Comments API

  Background:
    Given the API base URL is "https://jsonplaceholder.typicode.com"

  Scenario: Get all comments
    When I send a GET request to "/comments"
    Then the response status code should be 200
    And the response should contain 500 items

  Scenario: Get comments by valid postId
    When I send a GET request to "/comments?postId=1"
    Then the response status code should be 200
    And every item should have "postId" equal to 1

  Scenario: Get comments by invalid postId
    When I send a GET request to "/comments?postId=9999"
    Then the response status code should be 200
    And the response should contain 0 items
