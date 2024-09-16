Rails.application.routes.draw do
  resources :surveys do
    collection do
      get :refresh
    end
  end
end
