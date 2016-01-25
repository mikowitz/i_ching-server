defmodule IChing.Router do
  use IChing.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]

  end

  scope "/api", as: :api do
    pipe_through :api

    scope "/v1" do
      resources "/hexagrams", IChing.HexagramController, only: [:index, :show]
    end
  end

  scope "/", IChing do
    pipe_through :browser # Use the default browser stack

    get "/", HexagramController, :index
    resources "/hexagrams", HexagramController, only: [:show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", IChing do
  #   pipe_through :api
  # end
end
