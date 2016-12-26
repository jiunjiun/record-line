Rails.application.routes.draw do
  resources :rs, controller: :record, only: [:show] do
    collection do
      get 'file/:id', to: 'record#file', as: :file
    end
  end

  post :callback, to: 'callback#create', as: :callback

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
