defmodule AmnesiaApiWeb.BookController do
  use AmnesiaApiWeb, :controller

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.Book

  action_fallback AmnesiaApiWeb.FallbackController

  def index(conn, _params) do
    books = Amnesia.list_books()
    render(conn, "index.json", books: books)
  end

  def create(conn, %{"book" => book_params}) do
    with {:ok, %Book{} = book} <- Amnesia.create_book(book_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", book_path(conn, :show, book))
      |> render("show.json", book: book)
    end
  end

  def show(conn, %{"id" => id}) do
    book = Amnesia.get_book!(id)
    render(conn, "show.json", book: book)
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Amnesia.get_book!(id)

    with {:ok, %Book{} = book} <- Amnesia.update_book(book, book_params) do
      render(conn, "show.json", book: book)
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Amnesia.get_book!(id)
    with {:ok, %Book{}} <- Amnesia.delete_book(book) do
      send_resp(conn, :no_content, "")
    end
  end
end
