@stub_coinbase_request
Feature: Convert
  As a CLI
  I want to be able to convert coin to fiat
  and vice versa

  Scenario: Convert unsuccessful
    When I run `bit convert 10 FOO BAR`
    Then the output should contain "Currencies unavailable"
