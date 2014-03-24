App::Application.routes.draw do
  get  "/"          => "main#home"
  get  "/new_goat"  => "main#get_new_goat"
  post "/new_goat"  => "main#post_new_goat"
  get  "/goats/:id" => "main#get_goats"
  post "/goats/:id" => "main#post_goats"
end