# openCX-teamwip Development Report

Welcome to the documentation pages of the BirdChat of **openCX**!

You can find here detailed about the (sub)product, hereby mentioned as module, from a high-level vision to low-level implementation decisions, a kind of Software Development Report (see [template](https://github.com/softeng-feup/open-cx/blob/master/docs/templates/Development-Report.md)), organized by discipline (as of RUP):

* Business modeling
  * [Product Vision](#Product-Vision)
  * [Elevator Pitch](#Elevator-Pitch)
* Requirements
  * [Use Case Diagram](#Use-case-diagram)
  * [User stories](#User-stories)
  * [Domain model](#Domain-model)
* Architecture and Design
  * [Logical architecture](#Logical-architecture)
  * [Physical architecture](#Physical-architecture)
  * [Prototype](#Prototype)
* [Implementation](#Implementation)
* [Test](#Test)
* [Configuration and change management](#Configuration-and-change-management)
* [Project management](#Project-management)

So far, contributions are exclusively made by the initial team, but we hope to open them to the community, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.

Please contact us!

Thank you!
*Afonso Mendoça, Moisés Rocha, Paulo Marques, Tomás Figueiredo*

---

## Product Vision

This product's aim is to promote informal and relaxed discussions, meet-ups and hangouts in conferences, providing a way for people with similar interests to find and meet each other.

---

## Elevator Pitch

We know our demographic: the tech and software people are one of the most passionate people about what they do that we can find nowaways. And this is a really good thing, but this can lead to some underwhelming socialization aspects in big conferences and other similar events. What can happen is that discussions, talks and meet-ups between conference antendees eventually ends up being very tech-based and information heavy, which can be tiring. What if you just want to relax, hangout and talk about whatever you want to talk about? That's why we made BirdChat: a tool where people can arrange social events to talk about certain topics or visit someplace in the city or do a certain activity. There are no limits! You can talk about the conference activities, events, talk about football, music, go visit a museum on downtown or simply go get some dinner and some beers and see where that leads you to. Your call!

---

## Requirements

### Use case diagram

![Use case diagram](../img/Use&#32;case&#32;diagram.png "Use case diagram")

#### View Profile

* **Actor**. Conference attendee.

* **Description**. This use case exists so that the attendee can view his own profile.

* **Preconditions and Postconditions**.  In order to view the profile, the attendee must be logged in. In the end, the user will be able to see his personal information.
  
* **Normal Flow**.

  1. The attendee presses the button to show the sidebar from the Home/My Events page.
  2. The system will display a sidebar.
  3. The attendee presses the 'My Profile' button.
  4. The system will display the attendee's personal information.

#### View New Events

* **Actor**. Conference attendee.

* **Description**. This use case exists so that the attendee can view the most recente created events.

* **Preconditions and Postconditions**.  In order to view new events, the attendee must be logged in. In the end, the user will be able to see a list of new events with their title and description.
  
* **Normal Flow**.
  1. The attendee presses the 'Home' button.
  2. The system will load and display the most recent events.

#### View Event's Details

* **Actor**. Conference attendee.

* **Description**. This use case exists so that the attendee can view any event's details.

* **Preconditions and Postconditions**.  In order to view an event's details, the attendee must be logged in. In the end, the user will be able to see an event's details.
  
* **Normal Flow**.
  1. The attendee presses the home button.
  2. The system will load and display the most recent events.
  3. The attendee presses the arrow button on the event's card.
  4. The system will expand the card showing its details.

* **Alternative Flows and Exceptions**.
  1. The attendee presses the home button.
  2. The system will load and display the most recent events.
  3. The attendee presses the event's title.
  4. The system will show the event's chat.
  5. The attendee presses the details button.
  6. The system will display the event's details.

#### Join Event

* **Actor**. Conference attendee.

* **Description**. This use case exists so that the attendee can join an event.

* **Preconditions and Postconditions**.  In order to join an event, the attendee must be logged in. In the end, the user will be joined to that event.
  
* **Normal Flow**.
  1. The attendee presses the home button.
  2. The system will load and display the most recent events.
  3. The attendee presses the event's title.
  4. The system will show the event's chat.
  5. The attendee presses the join button.
  6. The system will remove the join button.

#### Use Event's Chat

* **Actor**. Conference attendee.

* **Description**. This use case exists so that the attendee can use the event's chat.

* **Preconditions and Postconditions**.  In order to use an event's chat, the attendee must be logged in and joined to the event. In the end, the user will be able to use the event's chat.
  
* **Normal Flow**.
  1. The attendee presses the home button.
  2. The system will load and display the most recent events.
  3. The attendee presses the event's title.
  4. The system will show the event's chat.

#### Create Event

* **Actor**. Conference attendee.

* **Description**. This use case exists so that the attendee can create new events.

* **Preconditions and Postconditions**.  In order to create an event, the attendee must be logged in. In the end, the user will be manage an event.
  
* **Normal Flow**.
  1. The attendee presses the home button.
  2. The system will load and display the most recent events.
  3. The attendee presses the create event button.
  4. The system will show a form fot he attendee to fill.
  5. The attendee fills the form's requirements.
  6. If the form is correctly filled, the system creates a new event.

* **Alternative Flows and Exceptions**.
  1. The attendee presses the home button.
  2. The system will load and display the most recent events.
  3. The attendee presses the create event button.
  4. The system will show a form fot he attendee to fill.
  5. The attendee fills the form's requirements.
  6. If the form is filled incorrectly, the system displays an error message.
  7. The attendee will be able to refill the form and proceed as normal.

#### View Joined Events

* **Actor**. Conference attendee.

* **Description**. This use case exists so that the attendee can view the event's he's a part of.

* **Preconditions and Postconditions**.  In order to view joined events, the attendee must be logged in. In the end, the user will be manage to view a list of all of his joined events.
  
* **Normal Flow**.
  1. The attendee presses the 'My Events' button.
  2. The system will load and display his joined events.

### User stories

#### Story #1

As a conference attendee, I want to be able to view new events, so that I can choose which ones interest me.

**User interface mockup**

![Mockup](../img/mockup2.png "UI Mockup 2")

**Acceptance tests**

* Given I’m a logged-in attendeee
* When I access the home page
* Then the system shows me the new events that have been created

**Value and effort**

Value: Must have.

Effort: M

#### Story #2

As a conference attendee, I want to be able to create a new event, so that I can chat and meet up with other attendees.

**User interface mockup**

![Mockup](../img/mockup6.png "UI Mockup 6")

**Acceptance tests**

* Given I’m a logged-in attendeee
* When I access the home page 
* Then the system shows me the new events that have been created
* When I click the button to create a new event
* Then the system shows me a form to fill
* When I fill the form with the necessary information in order to create an event
* Then the system creates a new event

**Value and effort**

Value: Must have

Effort: M

#### Story #3

As a conference attendee, I want to be able to view the events that I've already joined, so that I can continue to be updated with their current situation.

**User interface mockup**

![Mockup](../img/mockup7.png "UI Mockup 7")

**Acceptance tests**

* Given I’m a logged-in attendeee
* When I access the home page 
* Then the system shows me the new events that have been created
* When I click on the 'My Events' button
* Then the system shows me a list of every event I'm a part of

**Value and effort**

Value: Must have

Effort: M

#### Story #4

As a conference attendee, I want to be able to view an event's details, so that I can see more of its information.

**User interface mockup**

![Mockup](../img/mockup3-1.png "UI Mockup 3")
![Mockup](../img/mockup3-2.png "UI Mockup 3")

**Acceptance tests**

* Given I’m a logged-in attendeee
* When I access the home page 
* Then the system shows me the new events that have been created
* When I click one event's card arrow
* Then the system shows me that event's details
* When I click that event's title 
* Then the system shows me that event's chat page
* When I click the event details button
* Then the system show me that event's details page

**Value and effort**

Value: Must have

Effort: M

#### Story #5

As a conference attendee, I want to be able to join an event, so that I can meet and chat with other attendees.

**User interface mockup**

![Mockup](../img/mockup4.png "UI Mockup 4")

**Acceptance tests**

* Given I’m a logged-in attendeee
* When I access the home page 
* Then the system shows me the new events that have been created
* When I click one event's title
* Then the system shows me that event's chat page
* When I click the 'Join' button
* Then the system adds me to that event's attendees list

**Value and effort**

Value: Must have

Effort: M

#### Story #6

As a conference attendee, I want to be able to use an events chat, so that I can speak with the other attendees.

**User interface mockup**

![Mockup](../img/mockup5.png "UI Mockup 5")

**Acceptance tests**

* Given I’m a logged-in attendeee
* When I access the home page 
* Then the system shows me the new events that have been created
* When I click one event's title
* Then the system shows me that event's chat page
* Given I'm an attendee to that event
* When I write to that chat
* Then the system display my message to every other attendee

**Value and effort**

Value: Should have

Effort: M

#### Story #7

As a conference attendee, I want to be able to filter the events, so that I can view the ones that interest me the most.

**User interface mockup**

![Mockup]( "UI Mockup")

**Acceptance tests**

* Given I’m a logged-in attendeee
* When I access the home page 
* Then the system shows me the new events that have been created
* When I click on the search icon
* Then the system shows me the search event page with a text bar to search and filters to apply

**Value and effort**

Value: Won't have

Effort: L

#### Story #8

As a conference attendee, I want to be able to create my profile within the app, so that I can use it.

**Acceptance tests**

* Given I’m an attendeee
* When I access the application 
* Then the system show me the the login page
* When I click on the register button
* Then the system shows me a form of information to fill so I can register myself

**Value and effort**

Value: Won't have

Effort: L

#### Story #9

As a conference attendee, I want to see other group members' profiles, so that I can see their personal information.

**User interface mockup**

![Mockup](../img/mockup-8.png "UI Mockup")

**Acceptance tests**

* Given I’m a logged-in attendeee
* When I access the home page 
* Then the system shows me the new events that have been created
* When I click one event's title
* Then the system shows me that event's chat page
* When I click the event details button
* Then the system show me that event's details page
* When I click the joined users list arrow
* Then the system shows me every attendee that has joined the event
* When I click on their name
* Then the system shows me their profile page with their personal information

**Value and effort**

Value: Could have

Effort: M

#### Story #10

As a conference attendee, I want to be able to view my own profile, so that I get to check my personal information.

**User interface mockup**

![Mockup](../img/mockup1.png "UI Mockup 1")

**Acceptance tests**

```
Scenario: In home page, navigate to user profile page
    Given I have "HomePage" visible
    When I open the drawer
    And I tap the "MyProfileButton" button
    Then I should have "ProfilePage" page on screen
```

**Value and effort**

Value: Could have

Effort: M

### Domain model

![UML](../img/domain&#32;model.png "UML Class Diagram")

---

## Architecture and Design

### Logical architecture

For the development of bird chat we need to plan  an arquitecture having in mind a few key points:

* Simultaneous development -  since we had a team of 4 working
* Ease of Modification - because the project plan could change at any time depending on the backend
* Code reusability
* Multiple Views for the same models- since the app could display the same information in diferent ways.

To achieve this we opted for the Mode-View-Controller architectural pattern since it's a very useful pattern when developing apps. As the name suggests, this architectural pattern can be divided in three parts: Model, View and Controller.

* Model - Represents the data of the application. It's represented by the database mock that we used in the app.
* View - Displays the model data and sends actions to the controller, this can be observer on the pages of flutter.
* The controller provides model data to the view, and interprets user actions. On the context of BirdChat this can be seen as the logic behind the views that interprates user action and modifies the models accordingly.

![MVC](../img/mvc.png "MVC Diagram")

![PackageDiagram](../img/PackageDiagram.png "Package Diagram")

### Physical architecture

For this project, out intent was to design an app that promoted confraternization between the participants of a conference. To achieve this goal, we opted for flutter for it's simplicity which allowed to quickly get a basic app up and running and to focus on the features we wanted to implement. In addiction, flutter seemed easy to learn for unxeperience people in mobile developent like us.

The main components for the project are the user's device and the database server.

#### Deployment diagram

![DeploymentDiagram](../img/DeploymentDiagram.png "Deployment Diagram")

As stated before we used the MVC pattern. To accomplish this, we divided the project into three logical components, Controller, Model and View:

* The view is divided into pages and widgets and they are used to represent the information present on the models.
* The model stores all the information into a logical structure to be used by the other components. It gets its information by connecting to a database server.
* The controller processes actions trigger by the view and updates the model accordingly (ex:clicking a button sends an action to a controller which makes the app go to a different page).

#### Component Diagram

![ComponentDiagram](../img/ComponentDiagram.png "Component Diagram")

### Prototype

For the prototype we decided to tackle both the Story #1 ("As a conference attendee, I want to be able to view new gathering events, so that I can choose which ones interest me") , and the #2("As a conference attendee, I want to be able to create a new event, so that I can chat and meet up with other attendees"), this being the core ideia of our app.
We've created two pages for that. The first one was the home of the app which displayed the events on a list of cards with keypoints for every single one of them.  The second one was a form page designed to create events to add to that list. In addiction we also started working on the profile page and the chat part of the app.

---

## Implementation

Product increments can be found [here](https://github.com/softeng-feup/open-cx-teamwip/releases)

---

## Test

Automated tests using gherkin were planned to be implemented so that the application performed as intended, but due to time management issues only two are effectively done:

* Open user profile page
* Home to chat to details to creator profile

Although few, we plan to implement a few more:

* Check new events
* Check my events
* View event chat
* Join event
* View event's details page
* Visit attendees profile page

---

## Configuration and change management

Configuration and change management are key activities to control change to, and maintain the integrity of, a project’s artifacts (code, models, documents).

For the purpose of ESOF, we will use a very simple approach, just to manage feature requests, bug fixes, and improvements, using GitHub issues and following the [GitHub](https://guides.github.com/introduction/flow/) flow.

---

## Project Management

Links to tools that we are using to help us in **project management**:

* [Trello](https://trello.com/b/NQOzfzT2/birdchat)
