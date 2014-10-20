class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all


    @answer =Quiz.new

    @answers = Quiz.order(:name)

    respond_to do |format|
      format.html
      format.json { render :json => @answers }
    end


  end

  def show
    @quiz = Quiz.find(params[:id])
  end


  def create

    @answer = Quiz.new(
      :name => params[:name]
    )
    if @answer.save
      render json: @answer
    end

  end


end
