Routes = Router.new do
  match '/' => 'home#index'
  match '/home/index' => 'home#index'
  match '/echo' => 'echo#index'
  match '/user' => 'user#index'
  match '/user/show' => 'user#show'
end
