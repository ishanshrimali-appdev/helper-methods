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
end