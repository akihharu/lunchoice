class SeedController < ApplicationController
  def run
    if Rails.env.production?
      load(Rails.root.join('db', 'seeds.rb'))
      render plain: "Seed executed successfully"
    else
      render plain: "Not allowed in this environment"
    end
  end
end