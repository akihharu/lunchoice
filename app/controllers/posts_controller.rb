class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  before_action :set_dishes, only: [:new, :create, :edit, :update]

  def index
    @posts = Post.by_query(params[:query])
                 .by_dish(params[:dish_id])
                 .by_cuisine(params[:cuisine])
                 .includes(:user, :dish)
                 .order(created_at: :desc)

    @posts = @posts.page(params[:page]).per(10)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    
    if @post.save
      redirect_to posts_path, notice: '新しいランチを投稿しました！'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: '投稿を更新しました！'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: '投稿を削除しました', status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:dish_id, :photo, :comment)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user!
    unless @post.user == current_user
      redirect_to posts_path, alert: '他人の投稿は編集・削除できません'
    end
  end

  def set_dishes
    @dishes = Dish.all
  end
end