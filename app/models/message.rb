class Message

  include DataMapper::Resource

	property :id,    		 	Serial
	property :content,  		String

	has n, :hashtags, :through => Resource
end