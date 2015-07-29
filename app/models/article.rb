class Article < ActiveRecord::Base
	# has_many shows the relationship Article has with Comment.  An article can have multiple comments and when an article is deleted, then the comments will be destroyed.
	has_many :comments, dependent: :destroy
	validates 	:title, 
				presence: true,
				length: { minimum: 5 }
end
