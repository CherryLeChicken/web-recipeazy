class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    
    @comment = Comment.create(params[:comment].permit(:content))
    #IF YOU SEE THIS PAGE, IT MEANS YOU
    #DID NOT ENTER ANY CONTENT IN THE COMMENTS FORM.
    #PLEASE GO BACK TO CONTINUE TO RECIPEAZY. THANK YOU.
    
    @comment.user_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end
end
