Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphq"
  end

  post "/graphql", to: "graphql#execute"
end
