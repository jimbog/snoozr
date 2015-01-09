class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		# @user.posts
		@comment = Comment.new
	end

	def new
		@post = Post.new #like saying this ia an empty Post object
	end

	def create
		@post = Post.new(post_params)
		# others ways ... 
		# @post.user = current_user
		# @post = current_user.posts.new(post_params)
		if @post.save
			redirect_to posts_path
						# posts_path(@post)
						# ({post: @post.whatever})
		else 
			render :new
		end
	end

	def update # saving an update to a specific post
		@post = Post.find(params[:id])
		if @post.update_attributes(params.require(:post).permit(:image, :comment))
			redirect_to posts_path
		else #if unsuccessful, show edit page	
			render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private
	def post_params
		params.require(:post).permit(:user, :image, :comment)
	end

end
