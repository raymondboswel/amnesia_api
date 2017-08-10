defmodule AmnesiaApiWeb.ChapterController do
  use AmnesiaApiWeb, :controller

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.Chapter

  action_fallback AmnesiaApiWeb.FallbackController

  def index(conn, _params) do
    chapters = Amnesia.list_chapters()
    render(conn, "index.json", chapters: chapters)
  end

  def create(conn, %{"chapter" => chapter_params}) do
    with {:ok, %Chapter{} = chapter} <- Amnesia.create_chapter(chapter_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", chapter_path(conn, :show, chapter))
      |> render("show.json", chapter: chapter)
    end
  end

  def show(conn, %{"id" => id}) do
    chapter = Amnesia.get_chapter!(id)
    render(conn, "show.json", chapter: chapter)
  end

  def update(conn, %{"id" => id, "chapter" => chapter_params}) do
    chapter = Amnesia.get_chapter!(id)

    with {:ok, %Chapter{} = chapter} <- Amnesia.update_chapter(chapter, chapter_params) do
      render(conn, "show.json", chapter: chapter)
    end
  end

  def delete(conn, %{"id" => id}) do
    chapter = Amnesia.get_chapter!(id)
    with {:ok, %Chapter{}} <- Amnesia.delete_chapter(chapter) do
      send_resp(conn, :no_content, "")
    end
  end
end
