require 'rubygems'
require 'hpricot'
require 'open-uri'

# resume or job
post_type = 'resume' 

@post_url = ARGV[0]
doc = Hpricot(open("#{@post_url}"))

post_title = doc.search("//h2[@class='postingtitle']").inner_text
post_content = doc.search("#postingbody").inner_text

post_infos = doc.search("//div[@class='postinginfos']").inner_html
pp post_infos

puts "-------\n"
puts post_title
puts "\n\n"
puts post_content
