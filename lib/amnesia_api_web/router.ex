defmodule AmnesiaApiWeb.Router do
  use AmnesiaApiWeb, :router

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

  scope "/", AmnesiaApiWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", AmnesiaApiWeb do
    pipe_through :api
    resources "/users", UserController
    post "/users/login", UserController, :login
    resources "/books", BookController
    resources "/user_books", UserBookController
    delete "/user_books", UserBookController, :delete
    resources "/authors", AuthorController
    resources "/questions", QuestionController
    resources "/answers", AnswerController
    resources "/chapters", ChapterController
    resources "/chapter_questions", ChapterQuestionController
    resources "/book_sections", BookSectionController
    resources "/sections", SectionController
    resources "/section_questions", SectionQuestionsController
    resources "/book_authors", BookAuthorsController
  end
end
