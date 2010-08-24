Feature: Plugin generation
  In order to create my own plugin
  As a refinery user
  I want to generate a basic plugin directory structure

  Scenario: Generating a plugin with a name
    Given I have a refinery application
    When I generate a plugin with the arguments of "book title:string description:text image:image brochure:resource"
    Then I should have a directory "vendor/plugins/books"
    And I should have a directory "vendor/plugins/books/app"
    And I should have a directory "vendor/plugins/books/config"
    And I should have a directory "vendor/plugins/books/rails"
    And I should have a directory "vendor/plugins/books/rails"
    And I should have a file "vendor/plugins/books/rails/init.rb"
    And I should have a file "vendor/plugins/books/app/controllers/admin/books_controller.rb"
    And I should have a file "vendor/plugins/books/app/controllers/books_controller.rb"
    And I should have a file "vendor/plugins/books/app/models/book.rb"
    And I should have a file "vendor/plugins/books/config/routes.rb"
    And I should have a file "vendor/plugins/books/config/locales/en.yml"
    And I should have a file "vendor/plugins/books/app/views/admin/books/_form.html.haml"
    And I should have a file "vendor/plugins/books/app/views/admin/books/_sortable_list.html.haml"
    And I should have a file "vendor/plugins/books/app/views/admin/books/edit.html.haml"
    And I should have a file "vendor/plugins/books/app/views/admin/books/index.html.haml"
    And I should have a file "vendor/plugins/books/app/views/admin/books/new.html.haml"
    And I should have a file "vendor/plugins/books/app/views/admin/books/_book.html.haml"
    And I should have a file "vendor/plugins/books/app/views/books/index.html.haml"
    And I should have a file "vendor/plugins/books/app/views/books/show.html.haml"
