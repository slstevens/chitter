require 'dm-timestamps'

class Reply

	include DataMapper::Resource

	property :id,    		 	Serial
	property :reply_content,  	String
	property :created_at, 		DateTime

	has n, :hashtags, :through => Resource
 	belongs_to :message
 	belongs_to :user

 end