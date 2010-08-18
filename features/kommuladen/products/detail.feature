Feature: Details View of a Product
  In order to learn more about a product
  As a visitor
  I want to use the detailed view
  
  Background:
    Given a vendor exists with login: "carlos"
    And a shop exists with owner: that vendor
    And a product: lampe exists with title: "Lampe", price: 9.95
    And that shop's products include that product

  Scenario: Basic information is displayed
    When I go to the product's page
    Then I should see "Lampe" within "div.name"
    And I should see "9,95 €" within "div.price"
    And I should see that product's description within "div.description"

  Scenario: Shop information is displayed
    When I go to the product's page
    Then I should see that shop's name
    And I should see that shop's description
    And I should see the vendor's login

  Scenario: Images displayed
    Given an image exists
    And a portfolio exists
    And that portfolio's images include that image
    And that product's portfolio is that portfolio
    When I go to the product's page
    Then I should see that image
    And I should see that image's description within the "div.image.description"

  Scenario: I can visit the shop
    When I go to the product's page
    And I follow "Carlos"
    Then I should be on that shop's page

  Scenario: Tags displayed
    Given that product is tagged as "Papier"
    When I go to the product's page
    Then I should see "Papier" within "div.tags"

  Scenario: Labels displayed
    Given that product is labeled as "bio"
    When I go to the product's page
    Then I should see the "bio" icon within "div.labels"

  Scenario: Further products from same shop
    Given a product exists with title: "Puppe", price: 19.95
    When I go to the product: lampe page
    Then I should see "Puppe" within "div.other"

  Scenario: Payment options displayed
    When I go to the product's page
    Then I should see the product's payment_options within "div.payment"

  Scenario: Similar products displayed
    Given that product is tagged as "Papier"
    And a product exists with title: "Briefblock"
    And that product ist tagged as "Papier"
    When I go to the product: lampe page
    Then I should see "Briefblock" within "div.similar"



