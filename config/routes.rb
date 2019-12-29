Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "cocktails/home", to: "cocktails#home"
  root to: 'pages#home'
  get "javascript", to: "pages#javascript", as: :javascript
  resources :users, only: [:create]
  resources :cocktails, only: [:index, :show, :create, :destroy, :update] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy, :update, :edit]
  get "cocktails/:id/edit", to: "cocktails#editing", as: :editing
  # get "cocktails/:id", to: "cocktails#editing", as: :editing
  # I HAD THIS BEFORE BUT IT DID NOT SHOW ME THE EDITING HTML PAGE
  # IN THE BROWSER, THATS BECAUSE THE URL I SET WAS
  # "cocktails/:id" AND IT WAS ALREADY USED
  # BY THE cocktails :show (cocktails#show) AND SINCE IT READS FROM TOP
  # TO BOTTOM, THE URL IS ROUTED TO THE METHOD IN THE COCKTAILS CONTROLLER
  # SHOW! AND NOT EDITING!. I SOLVED THIS BY ADDING A NEW URL:
  # cocktails/:id/edit. NOW THE METHOD CALLED IS EDITING
end
