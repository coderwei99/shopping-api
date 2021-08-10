Rails.application.routes.draw do
  namespace :api,defaults:{format: :json} do
    namespace :v1 do
      resources :users, only: [ :index, :create, :show, :destroy, :update]      
    end
  end 
end
