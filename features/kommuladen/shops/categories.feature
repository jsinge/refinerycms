Feature: Shops products are spread in it's different categories
  In order to browse a shop for products
  As a visitor
  I want to use the shop view
  
  Background:
    Given A Refinery user exists
    And "Carlos" runs a shop "Lampenland"
    And that shop has a category "Holz"
    And that category has a product "Nachttischlampe"
    And that category has a product "Deckenfluter"
    And that shop has a category "Aluminium"
    And that category has a subcategory "draussen"
    And that category has a product "Gartenleuchte"
    And that category has a product "Balkonlampe"
    And that category has a subcategory "drinnen"
    And that category has a product "Stehlampe"
    
  Scenario: Show categories on shop's page
    When I go to the shop's page
    Then I should see "Holz" within "div.categories"
    And I should see "Aluminium" within "div.categories"
    And I should see "draussen" within "div.categories"
    And I should see "drinnen" within "div.categories"
    And I should see "draussen" as a subcategory of "Aluminium"
    And I should not see "Alumnium" as a subcategory of "Holz"
    And I should not see "Alumnium" as a subcategory of "drinnen"
    And I should not see "drinnen" as a subcategory of "Holz"

  Scenario: Browse category
    When I go to the shop's page
    And I follow "Holz" within "div.categories"
    Then I should be on the shop's page
    And I should see "Holz" within "h3.category_heading"
    And I should see "Deckenfluter" within "div.products"
    And I should see "Nachttischlampe" within "div.products"
    And I should not see "Balkonlampe" within "div.products"

  Scenario: Visit product of a category
    When I go to the shop's page
    And I watch the "Holz" category
    And I follow "Nachttischlampe"
    Then I should be on the product: "Nachttischlampe" page





