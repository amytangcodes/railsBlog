class CommentsController < ApplicationController
	http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)  #using create method on @article.comments to create and save the comment
		redirect_to article_path(@article)  #once new comment is created, send user back to original article
	end

	def destroy  #destroy action
		@article = Article.find(params[:article_id])  #find article we are looking at
		@comment = @article.comments.find(params[:id])  #locate comment within @article.comments collection
		@comment.destroy  #remove from database
		redirect_to article_path(@article) #send us back to show action for the article
	end
		
	private 
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end		

# You'll see a bit more complexity here than you did in the controller for articles. That's a side-effect of the nesting that you've set up. Each request for a comment has to keep track of the article to which the comment is attached, thus the initial call to the find method of the Article model to get the article in question.
