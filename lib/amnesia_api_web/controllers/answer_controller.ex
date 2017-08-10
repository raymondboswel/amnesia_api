defmodule AmnesiaApiWeb.AnswerController do
  use AmnesiaApiWeb, :controller

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.Answer

  action_fallback AmnesiaApiWeb.FallbackController

  def index(conn, _params) do
    answers = Amnesia.list_answers()
    render(conn, "index.json", answers: answers)
  end

  def create(conn, %{"answer" => answer_params}) do
    with {:ok, %Answer{} = answer} <- Amnesia.create_answer(answer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", answer_path(conn, :show, answer))
      |> render("show.json", answer: answer)
    end
  end

  def show(conn, %{"id" => id}) do
    answer = Amnesia.get_answer!(id)
    render(conn, "show.json", answer: answer)
  end

  def update(conn, %{"id" => id, "answer" => answer_params}) do
    answer = Amnesia.get_answer!(id)

    with {:ok, %Answer{} = answer} <- Amnesia.update_answer(answer, answer_params) do
      render(conn, "show.json", answer: answer)
    end
  end

  def delete(conn, %{"id" => id}) do
    answer = Amnesia.get_answer!(id)
    with {:ok, %Answer{}} <- Amnesia.delete_answer(answer) do
      send_resp(conn, :no_content, "")
    end
  end
end
