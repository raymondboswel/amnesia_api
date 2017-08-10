defmodule AmnesiaApiWeb.SectionQuestionsControllerTest do
  use AmnesiaApiWeb.ConnCase

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.SectionQuestions

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:section_questions) do
    {:ok, section_questions} = Amnesia.create_section_questions(@create_attrs)
    section_questions
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all section_questions", %{conn: conn} do
      conn = get conn, section_questions_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create section_questions" do
    test "renders section_questions when data is valid", %{conn: conn} do
      conn = post conn, section_questions_path(conn, :create), section_questions: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, section_questions_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, section_questions_path(conn, :create), section_questions: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update section_questions" do
    setup [:create_section_questions]

    test "renders section_questions when data is valid", %{conn: conn, section_questions: %SectionQuestions{id: id} = section_questions} do
      conn = put conn, section_questions_path(conn, :update, section_questions), section_questions: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, section_questions_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, section_questions: section_questions} do
      conn = put conn, section_questions_path(conn, :update, section_questions), section_questions: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete section_questions" do
    setup [:create_section_questions]

    test "deletes chosen section_questions", %{conn: conn, section_questions: section_questions} do
      conn = delete conn, section_questions_path(conn, :delete, section_questions)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, section_questions_path(conn, :show, section_questions)
      end
    end
  end

  defp create_section_questions(_) do
    section_questions = fixture(:section_questions)
    {:ok, section_questions: section_questions}
  end
end
