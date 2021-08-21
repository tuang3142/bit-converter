Feature: Rate
  As a CLI
  I want to be able to get exchange rates between fiat and crypto

  Scenario: Get successful
    When I run `bit rate USD USDT`
    Then the output should contain "1.0"

  Scenario: Get unsuccessful
    When I run `bit rate FOO BTC`
    Then the output should contain "Currencies FOO unavailable"

