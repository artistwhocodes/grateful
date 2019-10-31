class PostsController < ApplicationController
  before_action :authenticate
      # raise @post.inspect <--allows me to check if its hitting it
  def index
    @posts = Post.all
      @users = User.all
  end



  def show
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

    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to users_path, alert: "User not found"
    else
       @user = User.find_by(id: params[:user_id])
      @post = Post.new(user_id: params[:user_id])
    end
  #   @user = User.find_by(id: params[:user_id])
  # @user_ingredient_cost = @user.user_ingredient_costs.build()




    # @post = Post.new(user_id: params[:user_id])

   # @u.user_id
   # Display 10 ingredient fields
   # @post.posts.build()


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
    # byebug
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user.nil?
        redirect_to users_path, flash[:notice] = "post not found"
      else
        # Validate that posts being edited via nested
        # routing are in the user's posts collection.
        # Redirect to /users/id/posts if not.
        @post = user.posts.find_by(id: params[:id])
        redirect_to user_posts_path(user), flash[:notice] = "post not found" if @post.nil?
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
    if params[:user_id]
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "post deleted."
    redirect_to user_posts_path(@user)
    end
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      # @parameter = params[:search].downcase
      # @results = Store.all.where("lower(name) LIKE :search", search: @parameter)
      @results = Post.where("title LIKE ?", "#{params[:title]}%").where(user: current_user)

    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, tag_ids:[], tags_attributes: [:tag_name] , images: [])
  end
end
