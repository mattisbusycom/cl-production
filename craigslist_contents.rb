require 'rubygems'
require 'nokogumbo'

@path     = ARGV[1]
@site     = ARGV[0]

uri = "http://#{@site}.craigslist.org#{@path}"

puts "Opening #{uri}\n\n\n"
doc = Nokogiri::HTML5.get(uri)

pt = doc.at('h2.postingtitle').inner_text
puts "| POST TITLE: #{pt}"
puts ".---------------------------------------------------------------.\n"

pt = doc.at('section.userbody').inner_text
puts "#{pt}"
