require 'rubygems'

# XPATH Parsers
require 'hpricot'
require 'open-uri'

# HTTP REST to Craigslist Jobs Server @ //jobs.spclops.com
require 'rest-client'

# STDIN Input
@search = ARGV[0]
@site   = ARGV[1]
@iteration = ARGV[2]

# Setup Paging Increments.
#if ARGV[2].blank? 
#	ARGV[2] = '0'  # If it's not on the command line on Initial STDIN script execution at input by CLI User (or Program), then we are on our first run!
#else
#	ARGV[2] = ARGV[2] # We are on a 2nd or Nth Run Now --- this Script or another Worker must be handling it now !!! @todo
#end
#
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

# Start Script

runner = Craigslist.new("#{@search}", "#{@site}", "#{@iteration}")

url  = runner.get_url()
rows = runner.getDoc(url)

rows.each do |row|
	pt = row.search('a')[1].inner_text
	pl = row.search("//a")[0].attributes['href']
	pd = row.search("//span[@class='date']").inner_text
	puts "#{@iteration}.[#{@site}] #{pt} (#{pl}) on #{pd}\n"

	# .-------------------------------------------------------------------------------.
	# Hook Up to API (Stage 1)
	data = {}
	data["post_title"] = pt
	data["post_url"]   = pl
	data["post_dated"] = pd

	RestClient.post "http://jobs.spclops.com/craigslist_ads/add", data.to_json, :content_type => :json, :accept => :json
	# .-------------------------------------------------------------------------------.
end
