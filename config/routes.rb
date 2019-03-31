Rails.application.routes.draw do
  use_doorkeeper
  namespace :api do
    namespace :v1 do
      resources :students, controller: 'users', type: 'student' 
      resources :teachers, controller: 'users', type: 'teacher'
      resources :grades
      resources :courses
    end
  end
end
