defmodule AmnesiaApiWeb.SectionController do
  use AmnesiaApiWeb, :controller

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.Section
  alias AmnesiaApi.Amnesia.Book
  alias AmnesiaApi.Amnesia.BookSection

  action_fallback AmnesiaApiWeb.FallbackController

  def index(conn, _params) do
    sections = Amnesia.list_sections()
    render(conn, "index.json", sections: sections)
  end

  def create(conn, %{"book_id" => book_id, "section" => section_params}) do
    book = AmnesiaApi.Repo.get!(Book, book_id)
    with {:ok, %Section{} = section} <- Amnesia.create_section(section_params) do
      case Amnesia.create_book_section(%{book_id: book.id, section_id: section.id }) do
        {:ok, %BookSection{}} -> 
          conn 
          |> put_status(:created)
          |> put_resp_header("location", section_path(conn, :show, section))
          |> render("show.json", section: section)       
      end            
    end
  end

  def create(conn, %{"section" => section_params}) do
    with {:ok, %Section{} = section} <- Amnesia.create_section(section_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", section_path(conn, :show, section))
      |> render("show.json", section: section)
    end
  end

  def show(conn, %{"id" => id}) do
    section = Amnesia.get_section!(id)
    render(conn, "show.json", section: section)
  end

  def update(conn, %{"id" => id, "section" => section_params}) do
    section = Amnesia.get_section!(id)

    with {:ok, %Section{} = section} <- Amnesia.update_section(section, section_params) do
      render(conn, "show.json", section: section)
    end
  end

  def delete(conn, %{"id" => id}) do
    section = Amnesia.get_section!(id)
    with {:ok, %Section{}} <- Amnesia.delete_section(section) do
      send_resp(conn, :no_content, "")
    end
  end
end
