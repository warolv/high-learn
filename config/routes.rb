Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :students, controller: 'users', type: 'student' do
        get :highest_average_in_courses, on: :collection
      end
      
      resources :teachers, controller: 'users', type: 'teacher' do
        get :max_students, on: :collection
      end

      resources :grades
      
      resources :courses do
        get :easiest, on: :collection
      end
    end
  end
end
