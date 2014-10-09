require 'watir-webdriver'
require 'pry'


Before do | prerequisites|
		
		$browser = Watir::Browser.new :chrome		
		$browser.goto "http://www.amazon.co.uk/"
		puts 'From Before of Env.rb '

end


After do | housekeeping|
	sleep(5)
	$browser.close

end



