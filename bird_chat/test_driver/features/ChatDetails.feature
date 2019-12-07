Feature: Home to chat to details to creator profile
    Scenario: Navigating to profile of a chat creator
        Given I have "ChatCard1" visible
        When I tap "ChatCard1"
        Then I should have "ChatPage" page on screen

        Given I have "ChatDetailsButton" visible
        When I tap "ChatDetailsButton"
        Then I should have "GroupDetails" page on screen

        Given I have "CreatorProfileButton" visible
        When I tap "CreatorProfileButton"
        Then I should have "ProfilePage" page on screen