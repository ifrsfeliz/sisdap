Rails.application.routes.draw do
  resources :stockroom_items

  # Almoxarifado
  resources :accounting_actions
  resources :action_plans
  resources :exercises

  get 'orders/meus_pedidos'
  resources :orders do
    get 'solicitacao'
  end

  resources :requests do
    get 'status'
    resources :request_logs
  end

  resources :uasgs

  resources :item_classifications

  get 'items/for_aquisition'
  resources :items, only: :index

  resources :supplier_groups
  resources :suppliers

  post 'carts/add_item_to_cart'
  get 'carts/remove_item_from_cart'
  get 'carts/finalize'
  resource :cart

  resources :bids do
    resources :items
  end

  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'


  # Devise Configuration
  devise_for :users
  scope "/admin" do
    resources :users
  end

end
