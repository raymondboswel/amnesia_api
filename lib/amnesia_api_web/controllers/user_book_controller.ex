defmodule AmnesiaApiWeb.UserBookController do
  use AmnesiaApiWeb, :controller

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.UserBook
  alias AmnesiaApi.Repo

  action_fallback AmnesiaApiWeb.FallbackController

  def index(conn, _params) do
    user_books = Amnesia.list_user_books()
    render(conn, "index.json", user_books: user_books)
  end

  def create(conn, %{"user_book" => %{"user_id" => user_id, "book_id" => book_id}}) do
    user_book = Repo.get_by(UserBook, [book_id: book_id, user_id: user_id])
    if user_book != nil do
      conn 
      |> put_status(:created)
      |> put_resp_header("location", user_book_path(conn, :show, user_book))
      |> render("show.json", user_book: user_book)
    else
      with {:ok, %UserBook{} = user_book} <- Amnesia.create_user_book(user_book_params) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", user_book_path(conn, :show, user_book))
        |> render("show.json", user_book: user_book)
      end
    end
  end

  def show(conn, %{"id" => id}) do
    user_book = Amnesia.get_user_book!(id)
    render(conn, "show.json", user_book: user_book)
  end

  def update(conn, %{"id" => id, "user_book" => user_book_params}) do
    user_book = Amnesia.get_user_book!(id)

    with {:ok, %UserBook{} = user_book} <- Amnesia.update_user_book(user_book, user_book_params) do
      render(conn, "show.json", user_book: user_book)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_book = Amnesia.get_user_book!(id)
    with {:ok, %UserBook{}} <- Amnesia.delete_user_book(user_book) do
      send_resp(conn, :no_content, "")
    end
  end
end
