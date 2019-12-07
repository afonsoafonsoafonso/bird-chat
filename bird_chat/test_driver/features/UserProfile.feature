Feature: Open user profile page
    Scenario: In home page, navigate to user profile page
        Given I have "HomePage" visible
        When I open the drawer
        And I tap the "MyProfileButton" button
        Then I should have "ProfilePage" page on screen