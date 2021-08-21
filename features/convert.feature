Feature: Convert
  As a CLI
  I want to be able to convert coin to fiat
  and vice versa

  Scenario: Convert successful
    Given "BTC" price in USD is "45678.9"
    When I run `bit convert 10 BTC USDT
    Then the output should contain "456,789"

  Scenario: Convert unsuccessful
  #   When I run `bit pluralize --word Tomato`
  #   Then the output should contain "Tomatoes"
