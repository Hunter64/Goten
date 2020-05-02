defmodule GotenWeb.Router do
  use GotenWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GotenWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/users", UserController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", GotenWeb do
  #   pipe_through :api
  # end
end
