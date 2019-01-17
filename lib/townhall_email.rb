require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'xpath'


def get_townhall_email(townhall_url)
	town_email = []
	town_name = []
	townhall_url.each do |el|
		page = Nokogiri::HTML(open(el))
		page.xpath('//section[2]/div/table/tbody/tr[4]/td[2]').each do |email|
			town_email << email.text
		end
	end
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	page.xpath('//p/a').each do |el|
		town_name << el.text
	end
	townandmail = town_name.zip(town_email)
	final_array = []
	townandmail.each do |e|
		final_array << {e[0] => e[1]}
	end
	print final_array
	return final_array
end


	

def townhall_url
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	town_link = []
	page.xpath('//p/a').each do |el|
	    town_link << "http://annuaire-des-mairies.com#{el.attr('href')[1..-1]}"
	end
	return town_link
end

#get_townhall_email(townhall_url)
