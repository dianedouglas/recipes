Rails.application.routes.draw do

match('/', {:via => :get, :to => 'recipes#index'})
match('/recipes', {:via => :get, :to => 'recipes#index'})
match('/recipes', {:via => :post, :to => 'recipes#create'})
match('/recipes/new', {:via => :get, :to => 'recipes#new'})
match('/recipes/:id', {:via => :get, :to => 'recipes#show'})
match('/recipes/:id', {:via => [:patch, :put], :to => 'recipes#update'})
match('/recipes/:id/edit', {:via => :get, :to => 'recipes#edit'})

end
