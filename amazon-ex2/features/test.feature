Feature: TestAmazon

Scenario: Check Amazon web for a product

Given I opened the amazon web URL
When I search for 'Kindle Fire'
Then I should see atleast 1 result

Scenario: Check Amazon web for a product-negative test

Given I opened the amazon web URL
When I search for "Negative Test Search String on Fire"
Then I should see  0 results


