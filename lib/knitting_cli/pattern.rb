class KnittingCli::Pattern
	attr_accessor :name, :yarn_brand, :price, :description, :url

	@@all = []

	def initialize(name, yarn_brand, price, url)
		@name = name
		@yarn_brand = yarn_brand
		@price = price
		@url = url
		@@all << self
	end

	def self.new_from_site(p)
		self.new(
			p.css("h2.product-name").text
			p.css("div.product-info a").text
			p.css("p a.download-link").text
			p.attribute('href')
		)	
	end

	def self.all
		@@all
	end
	
	def description
		@description = pattern_page.css("div.std").text
	end

	def pattern_page
		@pattern_page = Nokogiri::HTML(open(self.url))
	end
	
	def knitting_list
		# KnittingCli::Scraper.scrape_index
		# name =  doc.css("h2.product-name")
		# yarn_brand = doc.css("div.product-info a")
	end


	def pattern_info
		# price = page.css("p a.download-link").text
		# description = page.css("div.std").text
		# pattern.description = pattern.url.css("div.std").text
	end
	

end
