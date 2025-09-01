package com.example.demo.runners;

import org.junit.runner.RunWith;
import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = "src/test/resources/features",
        glue = {"com.example.demo.steps"},
        plugin = {
                "pretty",
                "json:target/cucumber.json"   // Generate JSON only
        },
        monochrome = true
)
public class CucumberTestRunner {
}
