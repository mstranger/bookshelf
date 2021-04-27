root to: 'home#index'
resources :books, only: %i[index new create]

# get '/books',     to: 'books#index'
# get '/books/new', to: 'books#new'
# post '/books',    to: 'books#create'
