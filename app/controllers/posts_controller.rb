class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  before_action :set_dishes, only: [:new, :create, :edit, :update]

  def index
    @posts = Post.all.includes(:user, :dish).order(created_at: :desc)

    if params[:query].present?
      @posts = @posts.joins(:dish).where("dishes.name LIKE ?", "%#{params[:query]}%")
    end

    if params[:dish_id].present?
      @posts = @posts.where(dish_id: params[:dish_id])
    end

    if params[:cuisine].present?
      @posts = @posts.joins(:dish).where(dishes: { cuisine: params[:cuisine] })
    end

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