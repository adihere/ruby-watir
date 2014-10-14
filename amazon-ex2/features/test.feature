Feature: TestAmazon

Scenario: Check Amazon web for a product-postive test

Given I opened the amazon web URL
When I search for "Kindle Fire"
Then I should see atleast 1 result

Scenario: Check Amazon web for a product-negative test

Given I opened the amazon web URL
When I search for a non-existent product " The Kohinoor Diamond uncut pink and white from Golconda mines"
Then I should see 0 results


