defmodule AmnesiaApiWeb.BookController do
  use AmnesiaApiWeb, :controller

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.Book
  alias AmnesiaApi.Amnesia.BookAuthors
  alias AmnesiaApi.Amnesia.Author
  import Ecto.Query
  alias AmnesiaApi.Repo
  require Logger

  action_fallback AmnesiaApiWeb.FallbackController

  def index(conn, %{"search" => search}) do
    books = AmnesiaApi.Repo.all(from b in AmnesiaApi.Amnesia.Book, where: like(b.title, ^"%#{search}%")) 
    |> Repo.preload(:authors) 
    |> Repo.preload(:sections)
    Logger.debug "Books: #{inspect books}"
    render(conn, "index.json", books: books)
  end

  def index(conn, _params) do
    books = AmnesiaApi.Repo.all(from b in AmnesiaApi.Amnesia.Book) 
    |> Repo.preload(:authors)
    |> Repo.preload(:sections)
    Logger.debug "Books: #{inspect books}"
    render(conn, "index.json", books: books)
  end

  # Need to add or link authors if provided
  def create(conn, %{"book" => %{"authors" => authors, "title" => title, "subtitle" => subtitle}} ) do
    new_authors = Enum.filter(authors, fn(author) -> !Map.has_key?(author, "id") end)
    existing_authors = Enum.filter(authors, fn(author) -> Map.has_key?(author, "id") end)
    Enum.each(new_authors, fn(a) -> 
        case AmnesiaApi.Repo.insert(AmnesiaApi.Amnesia.Author.changeset(%Author{}, a)) do
          {:ok, author } -> 
            Logger.info "author: #{inspect author}"
            existing_authors = [author | existing_authors]
            Logger.debug "existing_authors: #{inspect existing_authors}"
          {:error, changeset} -> Logger.error "Could not add author: #{inspect changeset}"        
        end
      end)
    Logger.debug "existing_authors: #{inspect existing_authors}"
    case Amnesia.create_book(%{title: title, subtitle: subtitle}) do
      {:ok, book} ->         
        Logger.warn "Book: #{inspect book}"
        Logger.debug "Existing authors: #{inspect existing_authors}"
        res = Enum.each(existing_authors, fn(author) -> AmnesiaApi.Repo.insert(%BookAuthors{book_id: book.id, author_id: author.id}) end)
        Logger.info "Add book author result: #{inspect res}"
        conn 
          |> put_status(:created)
          |> put_resp_header("location", book_path(conn, :show, book))
          |> render("show.json", book: book)
      
      {:error, changeset} ->  Logger.error "Could not add book: #{inspect changeset}"
    end

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
