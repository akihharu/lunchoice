class DishesController < ApplicationController
  
  def index
    cuisine = params[:cuisine]
    main_dish = params[:main_dish]

    if cuisine.present? && main_dish.present?
      @dishes = Dish.where(cuisine: cuisine, main_dish: main_dish)
    else
      @dishes = []
    end
  end
end