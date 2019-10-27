Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '', to: 'product#index'
  get 'products', to: 'product#show_all'
  post 'products', to: 'product#create'
  get 'products/:id', to: 'product#show_by_id'
  put 'products/:id' => 'product#update'
  delete 'products/:id' => 'product#delete'
end