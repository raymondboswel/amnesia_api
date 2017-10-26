defmodule AmnesiaApiWeb.QuestionController do
  use AmnesiaApiWeb, :controller
  import Ecto.Query
  require Logger
  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.Question
  alias AmnesiaApi.Repo

  action_fallback AmnesiaApiWeb.FallbackController

  def index(conn, %{"book_id" => book_id}) do
    questions = AmnesiaApi.Repo.all(from q in AmnesiaApi.Amnesia.Question, where: q.book_id == ^book_id)
                |> AmnesiaApi.Repo.preload(:answers)
                |> AmnesiaApi.Repo.preload(:sections)
    Logger.debug "Questions: #{inspect questions}"
    render(conn, "index.json", questions: questions)
  end

  def index(conn, _params) do
    questions = Amnesia.list_questions()
    render(conn, "index.json", questions: questions)
  end


  def create(conn, %{"question" => question_params}) do
    with {:ok, question} <- Amnesia.create_question(question_params) do
      if question_params["section_id"] != "" and question_params["section_id"] != nil do
        {:ok, result} = Amnesia.create_section_questions(%{question_id: question.id, section_id: question_params["section_id"]})
      end
      question = question
      |> AmnesiaApi.Repo.preload(:answers)
      |> AmnesiaApi.Repo.preload(:sections)
      Logger.debug "Result #{inspect result}"
      conn
      |> put_status(:created)
      |> put_resp_header("location", question_path(conn, :show, question))
      |> render("show.json", question: question)
    end
  end

  def show(conn, %{"id" => id}) do
    question = Amnesia.get_question!(id)
                |> Repo.preload(:sections)
                |> Repo.preload(:answers)
    render(conn, "show.json", question: question)
  end

  def update(conn, %{"id" => id, "question" => question_params}) do
    question = Amnesia.get_question!(id)

    with {:ok, %Question{} = question} <- Amnesia.update_question(question, question_params) do
      question = question
                  |> Repo.preload(:sections)
                  |> Repo.preload(:answers)
      render(conn, "show.json", question: question)
    end
  end

  def delete(conn, %{"id" => id}) do
    question = Amnesia.get_question!(id)
    with {:ok, %Question{}} <- Amnesia.delete_question(question) do
      send_resp(conn, :no_content, "")
    end
  end
end
