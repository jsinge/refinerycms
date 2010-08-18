Feature: Details View of a Product
  In order to learn more about a product
  As a visitor
  I want to use the detailed view
  
  Background:
    Given a user exists with name: "Carlos"
    And a shop exists with owner: that user
    And a product exists with name: "Lampe", price: 9.95
    And a product listing exists with shop: that shop, product: that product

  Scenario: Basic information is displayed
    When I am on that products details view
    Then I should see "Lampe" in the "name" div
    And I should see "9,95 €" in the "price" div
    And I should see that product's description in the "description" div

  Scenario: Images displayed
    Given an image exists
    And a portfolio exists
    And that product's portfolio is that portfolio
    And that image is listed in that portfolio
    When I am on that products details view
    Then I should see that image
    And I should see that image's description in the "image description" div

  Scenario: Shop information is displayed
    When I am on that products details view
    Then I should see that shop's name
    And I should see that shop's description
    And I should see "Carlos"

  Scenario: I can visit the shop
   When I am on that products details view
   And I follow "Carlos"
   Then I should be on that shop's details view
