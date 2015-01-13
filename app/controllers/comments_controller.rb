class CommentsController < ApplicationController
	def 
		create
		post = Post.find(params[:post_id])
		new_comment = comment_params
		new_comment[:poster_name] = current_user.name
		comment = post.comments.create(new_comment)
		redirect_to post_path(comment.post)
		end

	private
	def comment_params
		params.require(:comment).permit(:body, commenter_attributes: [:name])
		# i want to show the name of who is commenting, do I need commenter_attr?
	end
end
