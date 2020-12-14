Rails.application.routes.draw do
  get "fale_conosco", to: "welcome#fale_conosco", as: :fale_conosco
  resources :line_items
  resources :carrinhos
  get 'control_users/index'
  devise_for :users
  resources :clientes
  get 'welcome/index'
  resources :departamentos
  get "produtos", to: "produtos#index"
  post "produtos/busca", to: "produtos#show", as: :busca_produto
  resources :produtos, only: [:new, :create, :destroy, :edit, :update]
  root to: "welcome#index"
end