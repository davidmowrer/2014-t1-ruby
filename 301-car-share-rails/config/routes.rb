App::Application.routes.draw do
  get  "/"              => "main#home"
  get  "/login"         => "main#get_login"
  post "/login"         => "main#post_login"
  get  "/reservations"  => "main#get_reservations"
  post "/reservations"  => "main#post_reservations"
end
