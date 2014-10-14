require 'watir-webdriver'
require 'pry'


Before do | prerequisites|
		
		$browser = Watir::Browser.new :chrome		
		$browser.goto "http://www.amazon.co.uk/"

end


After do | housekeeping|
	sleep(5)
	$browser.close
end



