Rails.application.routes.draw do
  resources :schools do
    member do
      get :delete
    end
  end
  resources :departments do
    member do
      get :delete
    end
  end
  resources :courses do
    member do
      get :delete
    end
  end
  resources :teachers do
    member do
      get :delete
    end
  end
  resources :students do
    member do
      get :delete
    end
  end
  resources :semesters do
    member do
      get :delete
    end
  end
  resources :course_enrollments
end
