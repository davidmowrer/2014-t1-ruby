App::Application.routes.draw do
  get  "/" => "main#index"
  post "/" => "main#index_post"
end
