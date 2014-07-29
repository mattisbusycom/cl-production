require 'rubygems'

# XPATH Parsers
require 'hpricot'
require 'open-uri'

# HTTP REST to Craigslist Jobs Server @ //jobs.spclops.com
require 'rest-client'

# STDIN Input
@search = ARGV[0]
@site   = ARGV[1]

class Craigslist
	def initialize(query, city, rescnt=0)	
    	@query = query
    	@city  = city

    	base = "http://#{city}.craigslist.org"

        if (rescnt == '0')
	    	@url = "#{base}/search/jjj/?query=#{query}&sort=date"
    	else
    		@url = "#{base}/search/jjj?s=#{rescnt}&catAbb=jjj&query=#{query}&sort=date"
    	end	

    	return @url
	end

	def getDoc(url)
		doc = Hpricot(open("#{url}"))
        
		tmp = doc.search("//div#toc_rows")
		@rows = tmp.search("//div[2]/p")
        
		return @rows
    end

	def get_url
		return @url
	end
end

runner = Craigslist.new("#{@search}", "#{@site}", 0)
url = runner.get_url()

rows = runner.getDoc(url)
rows.each do |row|
  pt = row.search('a')[1].inner_text
  pl = row.search("//a")[0].attributes['href']
  pd = row.search("//span[@class='date']").inner_text
  puts "#{pt} (#{pl}) on #{pd}\n"
end
