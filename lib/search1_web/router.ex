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
    resources "/developments", DevelopmentController
    resources "/organizations", OrganizationController
    resources "/administrations", AdministrationController

  end
 scope "/", Search1Web do
    pipe_through :ajax

   resources "/mechanism_drug", MechanismDrugController, except: [:new, :edit]
   resources "/namecodes", NameCodeController, except: [:new, :edit]
   resources "/namebrands", NameBrandController, except: [:new, :edit]
   resources "/namegenerics", NameGenericController, except: [:new, :edit]
   resources "/conditions", ConditionController, except: [:new, :edit] 
   resources "/phasehighsts", PhaseHighestController, except: [:new, :edit]
   resources "/dev_organizations", DevOrganizationController, except: [:new, :edit]
   resources "/dev_ads", DevAdController, except: [:new, :edit]
 end 

  # Other scopes may use custom stacks.
  # scope "/api", Search1Web do
  #   pipe_through :api
  # end
end
