require 'rubygems'
require 'nokogumbo'

@path     = ARGV[0]
@site     = ARGV[1]

uri = "http://#{@site}.craigslist.org#{@path}"

puts "Opening #{uri}\n\n\n"
doc = Nokogiri::HTML5.get(uri)

pt = doc.at('h2.postingtitle').inner_text
puts "| POST TITLE: #{pt}"
puts ".---------------------------------------------------------------.\n"

pt = doc.at('section.userbody').inner_text
puts "#{pt}"
