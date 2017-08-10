defmodule AmnesiaApiWeb.BookSectionController do
  use AmnesiaApiWeb, :controller

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.BookSection

  action_fallback AmnesiaApiWeb.FallbackController

  def index(conn, _params) do
    book_sections = Amnesia.list_book_sections()
    render(conn, "index.json", book_sections: book_sections)
  end

  def create(conn, %{"book_section" => book_section_params}) do
    with {:ok, %BookSection{} = book_section} <- Amnesia.create_book_section(book_section_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", book_section_path(conn, :show, book_section))
      |> render("show.json", book_section: book_section)
    end
  end

  def show(conn, %{"id" => id}) do
    book_section = Amnesia.get_book_section!(id)
    render(conn, "show.json", book_section: book_section)
  end

  def update(conn, %{"id" => id, "book_section" => book_section_params}) do
    book_section = Amnesia.get_book_section!(id)

    with {:ok, %BookSection{} = book_section} <- Amnesia.update_book_section(book_section, book_section_params) do
      render(conn, "show.json", book_section: book_section)
    end
  end

  def delete(conn, %{"id" => id}) do
    book_section = Amnesia.get_book_section!(id)
    with {:ok, %BookSection{}} <- Amnesia.delete_book_section(book_section) do
      send_resp(conn, :no_content, "")
    end
  end
end
