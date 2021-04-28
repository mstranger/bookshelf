root to: 'home#index'
resources :books, only: %i[index new show create destroy]

# get '/books',     to: 'books#index'
# get '/books/new', to: 'books#new'
# post '/books',    to: 'books#create'
# get '/books/:id', to: 'books#show'
# delete '/books/:id', to: 'books#destroy'
