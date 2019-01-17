require 'rubygems'
require 'nokogiri'
require 'open-uri'

def crypto_scrapper
	symbol = []
	value = []
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
	page.xpath('//td[3]').each do |el|
		symbol << el.text
	end
	page.xpath('//td[5]/a').each do |el2|
		value << el2.text[1..-1].to_f
	end
	symbolvalue = symbol.zip(value)
	final_array = []
	symbolvalue.each do |e|
		final_array << {e[0] => e[1]}
	end
	print final_array
	return final_array

end

crypto_scrapper
# //*[@id="id-bitcoin"]/td[3]
# //*[@id="id-ripple"]/td[3]