defmodule AmnesiaApiWeb.ChapterQuestionController do
  use AmnesiaApiWeb, :controller

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.ChapterQuestion

  action_fallback AmnesiaApiWeb.FallbackController

  def index(conn, _params) do
    chapter_questions = Amnesia.list_chapter_questions()
    render(conn, "index.json", chapter_questions: chapter_questions)
  end

  def create(conn, %{"chapter_question" => chapter_question_params}) do
    with {:ok, %ChapterQuestion{} = chapter_question} <- Amnesia.create_chapter_question(chapter_question_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", chapter_question_path(conn, :show, chapter_question))
      |> render("show.json", chapter_question: chapter_question)
    end
  end

  def show(conn, %{"id" => id}) do
    chapter_question = Amnesia.get_chapter_question!(id)
    render(conn, "show.json", chapter_question: chapter_question)
  end

  def update(conn, %{"id" => id, "chapter_question" => chapter_question_params}) do
    chapter_question = Amnesia.get_chapter_question!(id)

    with {:ok, %ChapterQuestion{} = chapter_question} <- Amnesia.update_chapter_question(chapter_question, chapter_question_params) do
      render(conn, "show.json", chapter_question: chapter_question)
    end
  end

  def delete(conn, %{"id" => id}) do
    chapter_question = Amnesia.get_chapter_question!(id)
    with {:ok, %ChapterQuestion{}} <- Amnesia.delete_chapter_question(chapter_question) do
      send_resp(conn, :no_content, "")
    end
  end
end
