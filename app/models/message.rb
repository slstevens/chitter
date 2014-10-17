require 'dm-timestamps'

class Message

  include DataMapper::Resource

	property :id,    		 	Serial
	property :content,  		String
	property :created_at, 		DateTime

	has n, :hashtags, :through => Resource
 	belongs_to :user
	# before :save, :link_hashtags

	# def link_hashtags
	# 	string = self.content
	# 	string.gsub(/#\w+/, "<a href='https://www.google.com'>Test</a>")
	# end

	# def link_hashtags
	# 	tag = self.hashtags
	# 	self.content.gsub(tag, "<a href='/hashtags/%23#{tag.gsub(/^./, "")}'>#{tag}</a>")
	# end
end

