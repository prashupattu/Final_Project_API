package com.example.demo.runners;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = "src/test/resources/features",
        glue = {"com.example.demo.steps"},
        plugin = {
                "pretty",
                "html:target/cucumber-html-reports",
                "json:target/cucumber.json"   // ✅ required for reporting plugin
        },
        monochrome = true
)
public class CucumberTestRunner {
}
