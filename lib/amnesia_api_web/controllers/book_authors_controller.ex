defmodule AmnesiaApiWeb.BookAuthorsController do
  use AmnesiaApiWeb, :controller

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.BookAuthors

  action_fallback AmnesiaApiWeb.FallbackController

  def index(conn, _params) do
    book_authors = Amnesia.list_book_authors()
    render(conn, "index.json", book_authors: book_authors)
  end

  def create(conn, %{"book_authors" => book_authors_params}) do
    with {:ok, %BookAuthors{} = book_authors} <- Amnesia.create_book_authors(book_authors_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", book_authors_path(conn, :show, book_authors))
      |> render("show.json", book_authors: book_authors)
    end
  end

  def show(conn, %{"id" => id}) do
    book_authors = Amnesia.get_book_authors!(id)
    render(conn, "show.json", book_authors: book_authors)
  end

  def update(conn, %{"id" => id, "book_authors" => book_authors_params}) do
    book_authors = Amnesia.get_book_authors!(id)

    with {:ok, %BookAuthors{} = book_authors} <- Amnesia.update_book_authors(book_authors, book_authors_params) do
      render(conn, "show.json", book_authors: book_authors)
    end
  end

  def delete(conn, %{"id" => id}) do
    book_authors = Amnesia.get_book_authors!(id)
    with {:ok, %BookAuthors{}} <- Amnesia.delete_book_authors(book_authors) do
      send_resp(conn, :no_content, "")
    end
  end
end
