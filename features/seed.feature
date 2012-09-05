Feature: Seed data
  In order to fill the database with sample servers
  As the system
  I want to run the seed task   
      
  Scenario: The basics
    Given I have run the seed task
    And I am on the home page
    Then I should see "Ulysses"
    And I should see "Goliath"
    And I should see "Zeus"
    