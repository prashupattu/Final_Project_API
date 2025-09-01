Feature: Posts API
  Testing CRUD operations on /posts endpoint using JSONPlaceholder API

  Background:
    Given the API base URL is "https://jsonplaceholder.typicode.com"

  Scenario: Get all posts
    When I send a GET request to "/posts"
    Then the response status code should be 200
    And the response should contain 100 items

  Scenario: Get a single post by ID
    When I send a GET request to "/posts/1"
    Then the response status code should be 200
    And the field "id" should equal 1

  Scenario: Create a new post with valid data
    When I send a POST request to "/posts" with body:
      """
      {
        "title": "foo",
        "body": "bar",
        "userId": 1
      }
      """
    Then the response status code should be 201
    And the field "title" should equal "foo"
    And the field "body" should equal "bar"
    And the field "userId" should equal 1

  # JSONPlaceholder does not validate, it always returns 201
  Scenario: Create a new post with missing required field
    When I send a POST request to "/posts" with body:
      """
      {
        "title": "incomplete"
      }
      """
    Then the response status code should be 201

  Scenario: Update a post with valid ID using PUT
    When I send a PUT request to "/posts/1" with body:
      """
      {
        "id": 1,
        "title": "updated title",
        "body": "updated body",
        "userId": 1
      }
      """
    Then the response status code should be 200
    And the field "title" should equal "updated title"

  # JSONPlaceholder returns 500, not 404, for invalid IDs
  Scenario: Update a post with invalid ID using PUT
    When I send a PUT request to "/posts/9999" with body:
      """
      {
        "id": 9999,
        "title": "invalid",
        "body": "invalid",
        "userId": 1
      }
      """
    Then the response status code should be 500

  Scenario: Delete a post with valid ID
    When I send a DELETE request to "/posts/1"
    Then the response status code should be 200

  # JSONPlaceholder returns 200 even if ID does not exist
  Scenario: Delete a post with invalid ID
    When I send a DELETE request to "/posts/9999"
    Then the response status code should be 200
