Rails.application.routes.draw do
  resources :users
  #ENDPOINTS API
  # ? All Users   -   get       -    http://localhost:3000/users
  # ? Create User -   post      -    http://localhost:3000/users
  # ? Update User -   put       -    http://localhost:3000/users/:id
  # ? Show User   -   get       -    http://localhost:3000/users/:id 
  # ? Delete User -   delete    -    http://localhost:3000/users/:id 
end
