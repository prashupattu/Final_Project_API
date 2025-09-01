package com.example.demo.runners;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = "src/test/resources/features",   // Path to your .feature files
        glue = {"com.example.demo.steps"},          // Package containing step definitions
        plugin = {
                "pretty",
                "json:target/cucumber.json",        // Generate JSON report
                "html:target/cucumber-reports.html" // Optional HTML report
        },
        monochrome = true
)
public class CucumberTestRunner {
}
