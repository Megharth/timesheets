defmodule TimesheetsWeb.Router do
  use TimesheetsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug TimesheetsWeb.Plugs.FetchCurrentUser
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TimesheetsWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/workers", WorkerController,
      only: [:new, :create, :delete, :show]

    resources "/sessions", SessionController,
      only: [:new, :create, :delete], singleton: true

    resources "/managers", ManagerController,
      only: [:show, :create, :new]

    resources "/jobs", JobController,
      only: [:index, :create, :new]

    resources "/timesheets", SheetController,
      only: [:new, :create, :show, :update]
  end

  # Other scopes may use custom stacks.
  # scope "/api", TimesheetsWeb do
  #   pipe_through :api
  # end
end
