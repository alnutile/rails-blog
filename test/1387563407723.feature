 
 Feature: pfizer.com exit link feature
 
   Scenario: "exit link"
     Given I am on "/"
     And I follow "Facebook"
     Then I should see "You are now leaving www.pfizer.com,"
     And I press "OK"
     Then I should see "It’s free and always will be."
