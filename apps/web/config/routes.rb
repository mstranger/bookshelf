root to: 'home#index'
resources :books

get '/not_implemented', to: 'home#not_implemented'

# get '/books',     to: 'books#index'
# get '/books/new', to: 'books#new'
# post '/books',    to: 'books#create'
# get '/books/:id', to: 'books#show'
# delete '/books/:id', to: 'books#destroy'
# get '/books/:id/edit', to: 'books#edit'
# patch '/books/:id', to: 'books#update'
