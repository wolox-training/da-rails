Rails.application.routes.draw do
  api_version(:module => "api/v1", :path => {:value => "api/v1"}, :default => true) do
    resources :books
    resources :book_suggestions, only: [:create]
    resources :users do
      resources :rents
    end
    mount_devise_token_auth_for 'User', at: 'auth'
  end   
end
