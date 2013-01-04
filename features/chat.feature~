Feature: Chat Feature

  Scenario: As a valid user, I can chat with my joyn contact
    #And I go back
    Given joyn app is running on the First Device
    And also in Second Device joyn app is running
    And I take a screenshot in all devices

    Then I clear prior notifications
    Then I clear prior notifications in Second Device
    Then I ensure that no prior notifications are present on both devices
    And I take a screenshot in all devices

    When I see the contact 'User' in joyn contacts list
    Then I select the contact 'User' in joyn contacts list
    And I start to chat with  the contact

    Given I take a screenshot in all devices

    Then I send the chat message 'first joyn chat message' to other contact
    Then I wait to see the ack sign
    And I go back
 
    Given I wait for 30 seconds for Joyn Notification in Second Device
    Then I take a screenshot in all devices

    Given I open Joyn Notification in Second Device
    Then I wait to see message text 'first joyn chat message' in Second Device
    And I take a screenshot in all devices

    Given I send the chat message 'first joyn chat message ack' to other contact in Second Device
    Then I wait to see the ack sign in Second Device 
   Given I wait for 30 seconds for Joyn Notification
    #Then I wait for 20 seconds for Joyn Notification
    And I take a screenshot in all devices
    
    Given I open Joyn Notification       
    Then I wait to see message text 'first joyn chat message ack'
    And I take a screenshot in all devices
        
#Then I wait to see the ack sign in Second Device

    #Then I take a screenshot
    #And I take a screenshot in Second Device

    
