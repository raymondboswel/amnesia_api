defmodule AmnesiaApiWeb.ChapterControllerTest do
  use AmnesiaApiWeb.ConnCase

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.Chapter

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:chapter) do
    {:ok, chapter} = Amnesia.create_chapter(@create_attrs)
    chapter
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all chapters", %{conn: conn} do
      conn = get conn, chapter_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create chapter" do
    test "renders chapter when data is valid", %{conn: conn} do
      conn = post conn, chapter_path(conn, :create), chapter: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, chapter_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, chapter_path(conn, :create), chapter: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update chapter" do
    setup [:create_chapter]

    test "renders chapter when data is valid", %{conn: conn, chapter: %Chapter{id: id} = chapter} do
      conn = put conn, chapter_path(conn, :update, chapter), chapter: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, chapter_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, chapter: chapter} do
      conn = put conn, chapter_path(conn, :update, chapter), chapter: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete chapter" do
    setup [:create_chapter]

    test "deletes chosen chapter", %{conn: conn, chapter: chapter} do
      conn = delete conn, chapter_path(conn, :delete, chapter)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, chapter_path(conn, :show, chapter)
      end
    end
  end

  defp create_chapter(_) do
    chapter = fixture(:chapter)
    {:ok, chapter: chapter}
  end
end
