Rails.application.routes.draw do
  root "lists#index"
  
  Rails.application.routes.draw do
  # get 'reviews/create'
  # get 'reviews/destroy'
    resources :lists, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :bookmarks, only: [:create, :new]
    end
    resources :bookmarks, only: [:destroy]
    
    resources :lists do
      resources :reviews, only: [:create, :destroy]
    end
  end
end