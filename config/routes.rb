Rails.application.routes.draw do
  # api/v1
  namespace :api do
    namespace :v1 do
      get 'search/posts'
      resources :posts
    end
  end
end
