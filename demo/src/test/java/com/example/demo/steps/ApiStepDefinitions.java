package com.example.demo.steps;

import io.cucumber.java.en.*;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import org.junit.Assert;

import static io.restassured.RestAssured.given;

public class ApiStepDefinitions {

    private String baseUrl;
    private Response response;

    @Given("the API base URL is {string}")
    public void the_api_base_url_is(String url) {
        this.baseUrl = url;
        RestAssured.baseURI = url;
    }

    @When("I send a GET request to {string}")
    public void i_send_a_get_request_to(String endpoint) {
        response = given().when().get(endpoint);
    }

    @When("I send a POST request to {string} with body:")
    public void i_send_a_post_request_to_with_body(String endpoint, String body) {
        response = given()
                .header("Content-Type", "application/json")
                .body(body)
                .when()
                .post(endpoint);
    }

    @When("I send a PUT request to {string} with body:")
    public void i_send_a_put_request_to_with_body(String endpoint, String body) {
        response = given()
                .header("Content-Type", "application/json")
                .body(body)
                .when()
                .put(endpoint);
    }

    @When("I send a PATCH request to {string} with body:")
    public void i_send_a_patch_request_to_with_body(String endpoint, String body) {
        response = given()
                .header("Content-Type", "application/json")
                .body(body)
                .when()
                .patch(endpoint);
    }

    @When("I send a DELETE request to {string}")
    public void i_send_a_delete_request_to(String endpoint) {
        response = given().when().delete(endpoint);
    }

    @Then("the response status code should be {int}")
    public void the_response_status_code_should_be(Integer expectedStatus) {
        Assert.assertEquals(expectedStatus.intValue(), response.getStatusCode());
    }

    @Then("the response should contain {int} items")
    public void the_response_should_contain_items(Integer count) {
        Assert.assertEquals(count.intValue(), response.jsonPath().getList("$").size());
    }

    @Then("the field {string} should equal {int}")
    public void the_field_should_equal_int(String field, Integer expected) {
        Assert.assertEquals(expected.intValue(), (int) response.jsonPath().getInt(field));
    }

    @Then("the field {string} should equal {string}")
    public void the_field_should_equal_string(String field, String expected) {
        Assert.assertEquals(expected, response.jsonPath().getString(field));
    }

    @Then("every item should have {string} equal to {int}")
    public void every_item_should_have_equal_to(String field, Integer expected) {
        for (Object val : response.jsonPath().getList(field)) {
            Assert.assertEquals(expected.intValue(), ((Number) val).intValue());
        }
    }

    @Then("the field {string} should not be null")
    public void the_field_should_not_be_null(String field) {
        Assert.assertNotNull(response.jsonPath().get(field));
    }
}
