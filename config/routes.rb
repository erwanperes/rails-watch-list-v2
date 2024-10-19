Rails.application.routes.draw do
  root "lists#index"
  
  Rails.application.routes.draw do
    resources :lists, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :bookmarks, only: [:create, :new]
    end
    resources :bookmarks, only: [:destroy]
  end
end