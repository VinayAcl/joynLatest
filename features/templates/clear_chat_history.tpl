Feature: Clear Chat History Feature

  Scenario: As a valid user I can clear all the chat history created with my joyn contact
    Given joyn app is running on the First Device
    And also in Second Device joyn app is running

    Then I open the main chat history page
    And I clear the chat history with last message 'first joyn'
    Then I take a screenshot

    Then I open the main chat history page in Second Device
    And I clear the chat history with last message 'first joyn' in Second Device
    And I take a screenshot in Second Device
