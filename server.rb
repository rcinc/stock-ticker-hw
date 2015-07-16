require "httparty"
require "nokogiri"
require "sinatra"


response = HTTParty.get("http://finance.yahoo.com/q?s=AAPL")

dom = Nokogiri::HTML(response.body)
puts dom.class

stock_price = dom.xpath('//*[@id="yfs_l84_aapl"]').first.content

prev_price = dom.xpath('//*[@class="yfnc_tabledata1"]').first.content

# puts stock_price
# puts prev_price

get '/' do
"Apple's stock is at #{stock_price} but it was #{prev_price} yesterday."
end
