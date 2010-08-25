Feature: Details View of a Product
  In order to learn more about a product
  As a visitor
  I want to use the detailed view
  
  Background:
    Given A Refinery user exists
    And "Carlos" runs a shop "Lampenland"
    And that shop sells "Lampe" for 9.95

  Scenario: Basic information is displayed
    When I go to the product's page
    Then I should see "Lampe"
    And I should see "9,95 €"
    And I should see that product's description

  Scenario: Shop information is displayed
    When I go to the product's page
    Then I should see that shop's title
    And I should see the user's name

  Scenario: Images displayed
    Given that product has an image
    When I go to the product's page
    Then I should see that image
    And I should see that image's description within "div.image.description"

  Scenario: I can visit the shop
    When I go to the product's page
    And I follow "Lampenland"
    Then I should be on that shop's page

  Scenario: I can visit the user
    When I go to the product's page
    And I follow "Carlos"
    Then I should be on that user's page

  Scenario: Tags displayed
    Given that product is tagged as "Papier, Maritim"
    When I go to the product's page
    Then that product should be tagged with "Papier"
    Then I should see "Papier" within "div.tags"

  Scenario: Labels displayed
    Given that product is labeled as "bio"
    When I go to the product's page
    Then I should see the "bio" icon within "div.labels"

  Scenario: Further products from same shop
    Given that shop sells "Puppe" for 19.95
    When I go to the product: "lampe" page
    Then I should see "Puppe" within "div.more"

  Scenario: Payment options displayed
    When I go to the product's page
    Then I should see the product's payment_options within "div.payment"

  Scenario: Similar products displayed
    Given that product is tagged as "Papier"
    And a product exists with title: "Briefblock"
    And that product is tagged as "Papier"
    When I go to the product: lampe page
    Then I should see "Briefblock" within "div.similar"



