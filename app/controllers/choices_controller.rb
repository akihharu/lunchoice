class ChoicesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def new
  end
  def create
    dish = Dish.find(params[:dish_id])
    @choice = current_user.choices.build(
      dish: dish,
      cuisin_at_choice: dish.cuisine,
      main_dish_at_choice: dish.main_dish,
    )

    if @choice.save
      flash[:notice] = "#{dish.name} を今日のランチに記録しました！"
      redirect_to root_path
    else
      flash[:alert] = "ランチの記録に失敗しました: #{@choice.errors.full_messages.join(', ')}"
      redirect_back fallback_location: dishes_path
    end
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "選択された料理が見つかりませんでした。"
    redirect_back fallback_location: dishes_path
  end
end
