Feature: Chat Feature

  Scenario: As a valid user I can chat with my joyn contact
    Given joyn app is running on the First Device
    And also in Second Device joyn app is running
    Then I take a screenshot
    And I take a screenshot in Second Device

    When I see the contact '<CHAT_CONTACT_FOR_DEVICE1>' in joyn contacts list
    Then I select the contact '<CHAT_CONTACT_FOR_DEVICE1>' in joyn contacts list
    When I start to chat with  the contact

    When I see the contact '<CHAT_CONTACT_FOR_DEVICE2>' in joyn contacts list in Second Device
    Then I select the contact '<CHAT_CONTACT_FOR_DEVICE2>' in joyn contacts list in Second Device
    When I start to chat with  the contact in Second Device
    And I take a screenshot in all devices

    Then I send the chat message 'first joyn chat message' to other contact
    Then I wait to see message text "first joyn chat message" in Second Device
    #Then I wait to see the ack sign

    Then I send the chat message 'first joyn chat message ack' to other contact in Second Device
    Then I wait to see message text "first joyn chat message ack"
    #Then I wait to see the ack sign in Second Device

    Then I take a screenshot
    And I take a screenshot in Second Device

    
