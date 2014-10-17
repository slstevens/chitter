class Hashtag

  include DataMapper::Resource

  has n, :messages, :through => Resource

  property :id, 		Serial
  property :text,	 	String

  # before :save, :link_hashtag

  # def link_hashtag
  # 	 self.text.sub!(/#\w+/, "<a href='www.google.com'>#{self.text}</a>")
  # end

end


