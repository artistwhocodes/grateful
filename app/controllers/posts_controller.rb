class PostsController < ApplicationController
      # raise @post.inspect <--allows me to check if its hitting it
  def index
    if params[:artist_id]
      @user = User.find_by(id: params[:user_id]).posts
    else @user.nil?
        redirect_to users_path, alert: "User not found"
    end
  end


  # def index
  #   if params[:artist_id]
  #     @user = User.find_by(id: params[:user_id]).posts
  #     if @user.nil?
  #       redirect_to users_path, alert: "User not found"
  #     end
  #   else
  #     @posts = Post.all
  #   end
  # end


  def show
    # if params[:user_id]
    #   @user = User.find_by(id: params[:user_id])
    #   @post = @user.post.find_by(id: params[:id])
    #   if @post.nil?
    #     redirect_to user_posts_path(@user), alert: "post not found"
    #   end
    # else
    #
    #   if @post.nil?
    #     redirect_to user_posts_path(@user), alert: "post not found"
    #   end
    # end
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @post = @user.posts.find_by(id: params[:id])
      if @post.nil?
        redirect_to user_posts_path(@user), alert: "Post not found"
      end
    else
      @post = Post.find(params[:id])
    end
  end

  def new
    # Validate that new posts created for an artist
    # via nested routing are created for valid artists,
    #  and redirect to /artists if not.
    #i basically copied this from the previous code along lab.
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to users_path, alert: "User not found"
    else
      @post = Post.new(user_id: params[:user_id])
    end
  end

  def create
    u = current_user
    @post = u.posts.create(post_params)
   if @post.save
      flash[:success] = "Posted!"
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    #Validate that posts being edited via nested routing
    #have a valid artist. Redirect to /artists if not.
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user.nil?
        redirect_to users_path, alert: "User not found"
      else
        # Validate that posts being edited via nested
        # routing are in the artist's posts collection.
        # Redirect to /artists/id/posts if not.
        @post = user.posts.find_by(id: params[:id])
        redirect_to user_posts_path(user), alert: "post not found" if @post.nil?
      end
    else
      @post = Post.find(params[:id])
    end
  end

  def update
    @post = Post.find(params[:id])

    @post.update(post_params)

    if @post.save
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "post deleted."
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, tag_ids:[], tags_attributes: [:tag_name] )
  end
end
