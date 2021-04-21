Rails.application.routes.draw do

  root "movies#index"

  # Routes for the Movie resource:

  # CREATE
  post "/movies" => "movies#create", as: :movies # movies_url & movies_path
  get "/movies/new" => "movies#new", as: :new_movie # new_movie_url & ...
          
  # READ
  get "/movies" => "movies#index"
  get "/movies/:id" => "movies#show", as: :movie # movie_path() & ...
  
  # UPDATE
  patch "/movies/:id" => "movies#update"
  get "/movies/:id/edit" => "movies#edit", as: :edit_movie # edit_movie_path() & ...
  
  # DELETE
  delete "/movies/:id" => "movies#destroy"

  #------------------------------

  # Routes for the Director resource:

  # root "directors#index" <--- this isn't needed because there is only one index page: movies#index. For symmetry, could have a directors#index as well that simply redirects to movies#index
  resources :directors






end