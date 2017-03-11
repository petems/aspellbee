Feature: config
  In order to easily load aspellbee config
  As a user
  I should be able to load aspellbee config from a .aspellbee in the current directory

  Scenario: Read config from current directory
    Given a '.aspellbee' config with data:
"""
---
aspell_config:
  access_token: en_US
  suggestion_mode: normal
  mode: html
"""
    When I run `aspellbee config`
    Then the exit status should not be 1
    And the output should contain "access_token: en_US"
    And the output should contain "suggestion_mode: normal"
    And the output should contain "mode: html"
