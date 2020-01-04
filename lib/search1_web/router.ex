defmodule Search1Web.Router do
  use Search1Web, :router

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

  pipeline :ajax do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end


  scope "/", Search1Web do
    pipe_through :browser

    get "/", PageController, :index
    resources "/items", ItemController
    resources "/drugs", DrugController
    resources "/mechanisms", MechanismController

  end
 scope "/", Search1Web do
    pipe_through :ajax

   resources "/mechanism_drug", MechanismDrugController, except: [:new, :edit]
 
 end 

  # Other scopes may use custom stacks.
  # scope "/api", Search1Web do
  #   pipe_through :api
  # end
end
