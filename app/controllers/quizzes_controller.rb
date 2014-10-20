class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all


    @answer =Quiz.new

    @answers = Quiz.order(:answer_item)

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
      :answer_item => params[:answer_item]
    )
    if @answer.save
      render json: @answer
    end

  end


end
