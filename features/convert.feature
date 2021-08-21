@stub_coinbase_request
Feature: Convert
  As a CLI
  I want to be able to convert coin to fiat
  and vice versa

  Scenario: Convert successful
    When I run `bit convert 10 BTC USDT`
    Then the output should contain "456,789"

  Scenario: Convert unsuccessful
