Rails.application.routes.draw do
  root "todos#index"

  resources :todos do
    resources :items
  end

end
