Rails.application.routes.draw do
  # get 'schools/index'
  # get 'schools/show'
  # get 'schools/new'
  # get 'schools/edit'
  # get 'schools/delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :schools do
    member do
      get :delete
    end
  end

end
