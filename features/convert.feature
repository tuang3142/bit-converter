# @stub_coinbase_request
Feature: Convert
  As a CLI
  I want to be able to convert coin to fiat
  and vice versa

  Scenario: Currencies unavailable
    When I run `bit convert 10 FOO BAR`
    Then the output should contain "Currencies BAR unavailable"

  Scenario: Converts successful
    When I run `bit convert 1 BTC ETH`
    Then the output should contain "Currencies BAR unavailable"
