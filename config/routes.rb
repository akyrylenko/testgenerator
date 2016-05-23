Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :judo_payments do
    collection do
      get 'checkout' => "judo_payments#checkout"
      post 'success' => "judo_payments#success"
      get 'success' => "judo_payments#success"
      post 'failure' => "judo_payments#failure"
      get 'failure' => "judo_payments#failure"
    end
  end
end
