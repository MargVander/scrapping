require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'xpath'


def first_name
	page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
	arrayfirstname = []
	page.xpath('//a/div/span[2]').each do |el|
		el = el.text
		arrayfirstname << el[el.index(', ')+2..-1].gsub(/\s+$/,'')
	end
	return arrayfirstname
end

def last_name
	page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
	arraylastname = []
	page.xpath('//a/div/span[2]').each do |el|
		el = el.text
		arraylastname << el[7..el.index(', ')-1].gsub(/\s+$/,'')
	end
	return arraylastname
end


def email
	i = 0
	arrayemail = []
	page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
	page.xpath('//tr/td/a').each do |el|
		depurl = Nokogiri::HTML(open("https://www.nosdeputes.fr#{el.attr('href')}"))
		depurl.xpath('//ul[2]/li[1]/ul/li[1]/a').each do |email|
			arrayemail << email.text
			puts i
			i = i + 1
		end
	end
	return arrayemail
end

def depute_info(first_name, last_name, email)
	final_array = []
	n = 0
	while n <= 599
		final_array << {"first_name" => first_name[n], "last_name" => last_name[n], "email" => email[n]}
		puts n
		n = n + 1
	end
	print final_array
	return final_array


end

#depute_info(first_name, last_name, email)
