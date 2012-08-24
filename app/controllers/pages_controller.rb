class PagesController < ApplicationController
  def about
 
@title = "about"

  end
  def search
  @title = "search"  end

  def home
 @title = params[:q]
	if params[:q] 
		require 'rubygems'
		require 'wikicloth'
		require 'media_wiki'
		require 'nokogiri'
		mw = MediaWiki::Gateway.new('http://en.wikipedia.org/w/api.php/')
	#	wiki = WikiCloth::Parser.new({:data => mw.get(params[:q])}) 
		wiki =  mw.render(params[:q])
		@doc = Nokogiri::HTML(wiki)
		@para1 = @doc.xpath('//p[1]').text 
    		@contents = @doc.xpath('//table[@id="toc"]')
		

	end
if params[:c] 
		require 'rubygems'
		require 'calc'
		@output = Calc.evaluate(params[:c]) 
	end
end


  def contact
  @title = "contact"
  end
end
