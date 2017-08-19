defmodule AmnesiaApiWeb.SectionQuestionsController do
  use AmnesiaApiWeb, :controller

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.SectionQuestions

  require Logger

  action_fallback AmnesiaApiWeb.FallbackController

  def index(conn, _params) do
    section_questions = Amnesia.list_section_questions()
    render(conn, "index.json", section_questions: section_questions)
  end

  def create(conn, %{"section_questions" => section_questions_params}) do
    Logger.debug "Section questions params: #{inspect section_questions_params}"
    with {:ok, %SectionQuestions{} = section_questions} <- Amnesia.create_section_questions(section_questions_params) do
      Logger.debug "Section questions: #{inspect section_questions}"
      conn
      |> put_status(:created)
      |> put_resp_header("location", section_questions_path(conn, :show, section_questions))
      |> render("show.json", section_questions: section_questions)
    end
  end

  def show(conn, %{"id" => id}) do
    section_questions = Amnesia.get_section_questions!(id)
    render(conn, "show.json", section_questions: section_questions)
  end

  def update(conn, %{"id" => id, "section_questions" => section_questions_params}) do
    section_questions = Amnesia.get_section_questions!(id)

    with {:ok, %SectionQuestions{} = section_questions} <- Amnesia.update_section_questions(section_questions, section_questions_params) do
      render(conn, "show.json", section_questions: section_questions)
    end
  end

  def delete(conn, %{"id" => id}) do
    section_questions = Amnesia.get_section_questions!(id)
    with {:ok, %SectionQuestions{}} <- Amnesia.delete_section_questions(section_questions) do
      send_resp(conn, :no_content, "")
    end
  end
end
