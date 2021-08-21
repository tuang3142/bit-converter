Feature: Convert
  As a CLI
  I want to be able to convert between fiat and crypto

  Scenario: Currencies unavailable
    When I run `bit convert 10 FOO BAR`
    Then the output should contain "Currencies BAR unavailable"

  Scenario: Converts successful
    When I run `bit convert 1 USDT USD`
    Then the output should contain "1.0"
    When I run `bit convert 1 USD USDT`
    Then the output should contain "1.0"
