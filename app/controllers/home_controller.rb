class HomeController < ApplicationController
  def index
  	@questions = Question.order(created_at: :desc).all
  	@answers = Answer.all.count
  end

  def about
  end

  def temp
  	redirect_to root_path
  end
end
