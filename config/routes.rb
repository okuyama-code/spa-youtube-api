Rails.application.routes.draw do
  # api/v1
  namespace :api do
    namespace :v1 do
      resources :posts
    end
  end
end
