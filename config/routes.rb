Rails.application.routes.draw do
  resources :todolists do
    resources :todoitems, only: [:create, :destroy] do
      member do
        patch :complete
      end
    end
  end

  root "todolists#index"
end
