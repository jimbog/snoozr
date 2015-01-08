class CommentsController < ApplicationController
	def 
		create
		post = Post.find(params[:post_id])
		# gives up back specific post object that the post will belong to
		# we don't need to access w/in a view so we don't need '@post'
		comment = post.comments.create(comment_params)
		redirect_to post_path(comment.post)
		end

	private
	def comment_params
		params.require(:comment).permit(:body, commenter_attributes: [:name, :email])
	end
end
