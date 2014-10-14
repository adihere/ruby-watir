require 'watir-webdriver'
require 'pry'


  Given(/^I opened the amazon web URL$/) do
    #$browser = Watir::Browser.new :chrome
    #$browser.goto "http://www.amazon.co.uk/"	  
  end

  When(/^I search for 'Kindle Fire'$/) do
    $browser.text_field(:id => 'twotabsearchtextbox').set("Kindle Fire")
    $browser.button(:value => 'Go').click
  end
  Then(/^I should see atleast (\d+) result$/) do |expectedcount|
    strFullResult =  $browser.h2(:id => 's-result-count').text
    #binding.pry
    indexStart = strFullResult.index('of ')
    indexEnd = strFullResult.index(' results')
    strActualResult = strFullResult [indexStart+3,indexEnd-8]  
    countActualResult = strActualResult.gsub(',','').to_i
    puts countActualResult
    if  countActualResult >= expectedcount.to_i
     	puts 'Multiple Results - Test Pass'	
    end       
  end


When(/^I search for 'Negative Test Search String on Fire'$/) do
  $browser.text_field(:id => 'twotabsearchtextbox').set("Negative Test Search String on Fire")
  $browser.button(:value => 'Go').click
end

Then(/^I should see  (\d+) results$/) do |expectedcount2|
    strNoResult =  $browser.h1(:id => 'noResultsTitle').text
    
    #binding.pry

    if strNoResult.include? "did not match any products"
        puts "Test Pass - No reslts found"
    end    

end