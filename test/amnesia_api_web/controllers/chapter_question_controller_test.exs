defmodule AmnesiaApiWeb.ChapterQuestionControllerTest do
  use AmnesiaApiWeb.ConnCase

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.ChapterQuestion

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:chapter_question) do
    {:ok, chapter_question} = Amnesia.create_chapter_question(@create_attrs)
    chapter_question
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all chapter_questions", %{conn: conn} do
      conn = get conn, chapter_question_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create chapter_question" do
    test "renders chapter_question when data is valid", %{conn: conn} do
      conn = post conn, chapter_question_path(conn, :create), chapter_question: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, chapter_question_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, chapter_question_path(conn, :create), chapter_question: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update chapter_question" do
    setup [:create_chapter_question]

    test "renders chapter_question when data is valid", %{conn: conn, chapter_question: %ChapterQuestion{id: id} = chapter_question} do
      conn = put conn, chapter_question_path(conn, :update, chapter_question), chapter_question: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, chapter_question_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, chapter_question: chapter_question} do
      conn = put conn, chapter_question_path(conn, :update, chapter_question), chapter_question: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete chapter_question" do
    setup [:create_chapter_question]

    test "deletes chosen chapter_question", %{conn: conn, chapter_question: chapter_question} do
      conn = delete conn, chapter_question_path(conn, :delete, chapter_question)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, chapter_question_path(conn, :show, chapter_question)
      end
    end
  end

  defp create_chapter_question(_) do
    chapter_question = fixture(:chapter_question)
    {:ok, chapter_question: chapter_question}
  end
end
