require 'watir-webdriver'
require 'pry'


# Positive Test
  Given(/^I opened the amazon web URL$/) do
    #$browser = Watir::Browser.new :chrome
    #$browser.goto "http://www.amazon.co.uk/"	  
  end

  When(/^I search for "(.*?)"$/) do |argString|
    $browser.text_field(:id => 'twotabsearchtextbox').set(argString)
    $browser.button(:value => 'Go').click
  end

  Then(/^I should see atleast (\d+) result$/) do |expectedcount|


# Handle results
    strFullResult =  $browser.h2(:id => 's-result-count').text
    #binding.pry
    indexStart = strFullResult.index('of ')
    indexEnd = strFullResult.index(' results')
    strActualResult = strFullResult [indexStart+3,indexEnd-8]  
    countActualResult = strActualResult.gsub(',','').to_i
    if  countActualResult >= expectedcount.to_i
     	puts ' Result Found - Test Pass'	
    end       
  end


  When(/^I search for a non-existent product "(.*?)"$/) do |argString|
    $browser.text_field(:id => 'twotabsearchtextbox').set(argString)
    $browser.button(:value => 'Go').click
  end


# Handle zero results
Then(/^I should see (\d+) results$/) do |expectedcount2|
    strNoResult =  $browser.h1(:id => 'noResultsTitle').text
    if strNoResult.include? "did not match any products"
        puts "Test - No reslts found"
    end        
end

  


