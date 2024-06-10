Rails.application.routes.draw do
  resources :content_blocks do
    get 'new/:block_type', to: 'content_blocks#new', on: :collection, as: :new
    get ':block_type/schema', to: 'content_blocks#info', on: :collection, as: :info
  end
end
