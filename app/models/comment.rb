class Comment < ActiveRecord::Base
	# The other side to the relationship is that comments will always belong to a specific article.
  	belongs_to :article
end
