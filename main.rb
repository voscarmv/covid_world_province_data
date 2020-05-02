require 'mysql2'
require 'nokogiri'
require 'httparty'

client = Mysql2::Client.new(:host => "localhost", :username => "atlas", :database => 'world', :password => 'atlas')
result = client.query('select countries.name as country, regions.name as province from countries join regions where countries.id = regions.country_id and countries.name = "Mexico";')

result.each { |province|
  puts "Coutry name: #{province['country']}"
  puts "Province name: #{province['province']}"
  puts "Wiki URL: https://en.wikipedia.org/wiki/2020_coronavirus_pandemic_in_#{province['country']}"
}