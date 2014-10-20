Rails.application.routes.draw do

  root "quizzes#index"

  resources :quizzes do
    resources :questions
  end
end
