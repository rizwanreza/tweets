Feature: Display tweets
  In order to see all the tweets
  As a Saudi
  I want to view the recent tweets by Saudis

  Scenario: Show Last Tweet
    When I go to the homepage
    Then I should see "Sauditweets.com has launched."
  
  Scenario: Show all tweets
    When I am on the homepage
    Then I should see "I would so much love"
  
  
  
  
  
