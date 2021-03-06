defmodule AmnesiaApiWeb.AnswerControllerTest do
  use AmnesiaApiWeb.ConnCase

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.Answer

  @create_attrs %{answer: "some answer", rating: 120.5}
  @update_attrs %{answer: "some updated answer", rating: 456.7}
  @invalid_attrs %{answer: nil, rating: nil}

  def fixture(:answer) do
    {:ok, answer} = Amnesia.create_answer(@create_attrs)
    answer
  end

  def fixture(:question) do
    {:ok, question} = Amnesia.create_question(%{text: "test question"})
  end

  def fixture(:book) do
    {:ok, book} = Amnesia.create_book(%{title: "Test book", subtitle: "subtitle", summary: "", })
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all answers", %{conn: conn} do
      conn = get conn, answer_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create answer" do
    test "renders answer when data is valid", %{conn: conn} do
      {:ok, question} = fixture(:question)
      conn = post conn, answer_path(conn, :create), %{answer: @create_attrs, question_id: question.id}
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, answer_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "answer" => "some answer",
        "rating" => 120.5}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, answer_path(conn, :create), %{answer: @invalid_attrs, question_id: 12}
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update answer" do
    setup [:create_answer]

    test "renders answer when data is valid", %{conn: conn, answer: %Answer{id: id} = answer} do
      conn = put conn, answer_path(conn, :update, answer), answer: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, answer_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "answer" => "some updated answer",
        "rating" => 456.7}
    end

    test "renders errors when data is invalid", %{conn: conn, answer: answer} do
      conn = put conn, answer_path(conn, :update, answer), answer: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete answer" do
    setup [:create_answer]

    test "deletes chosen answer", %{conn: conn, answer: answer} do
      conn = delete conn, answer_path(conn, :delete, answer)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, answer_path(conn, :show, answer)
      end
    end
  end

  defp create_answer(_) do
    answer = fixture(:answer)
    {:ok, answer: answer}
  end

  defp create_question(_) do
    question = fixture(:question)
    {:ok, question: question}
  end
end
