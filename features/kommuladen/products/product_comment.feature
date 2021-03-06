Feature: Commenting a Product
  In order to comment a product
  As a Customer
  I want to use the detailed view

  Background:
    Given a product exists with title: "Tonschale"
    And a user exists with name: "Sarah"
    And I am logged in as that user

  Scenario: don't display comment field unless logged in
    Given I am logged out
    When I go to the product's page
    Then I should not see "Kommentar schreiben"

  Scenario: display comment field
    When I go to the product's page
    Then I should see "Kommentar schreiben"

  Scenario: read a comment
    Given a comment exists with text: "ein tolles Geschenk"
    And that comment belongs to that product
    And I go to the product's page
    Then I should see "ein tolles Geschenk" within "div.products_comments"

  Scenario: write a comment
    When I go to the product's page
    And I fill in "Kommentar schreiben" with "Die Schale sieht etwas klobig aus"
    And I press "Kommentar abschicken"
    Then I should be on the product's page
    And I should see "Kommentar übermittelt"
    And I should see "Die Schale sieht etwas klobig aus" within "div.products_comments"
    And I should see "Sarah" within "div.comments_author"

  Scenario: product has no comments
    Given that product has no comments
    And I go to the product's page
    Then I should see "Bisher gibt es keine Kommentare zu diesem Artikel. Möchten Sie diesen Artikel kommentieren?"
    


