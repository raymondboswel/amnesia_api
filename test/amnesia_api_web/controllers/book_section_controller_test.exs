defmodule AmnesiaApiWeb.BookSectionControllerTest do
  use AmnesiaApiWeb.ConnCase

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.BookSection

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:book_section) do
    {:ok, book_section} = Amnesia.create_book_section(@create_attrs)
    book_section
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all book_sections", %{conn: conn} do
      conn = get conn, book_section_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create book_section" do
    test "renders book_section when data is valid", %{conn: conn} do
      conn = post conn, book_section_path(conn, :create), book_section: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, book_section_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, book_section_path(conn, :create), book_section: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update book_section" do
    setup [:create_book_section]

    test "renders book_section when data is valid", %{conn: conn, book_section: %BookSection{id: id} = book_section} do
      conn = put conn, book_section_path(conn, :update, book_section), book_section: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, book_section_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, book_section: book_section} do
      conn = put conn, book_section_path(conn, :update, book_section), book_section: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete book_section" do
    setup [:create_book_section]

    test "deletes chosen book_section", %{conn: conn, book_section: book_section} do
      conn = delete conn, book_section_path(conn, :delete, book_section)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, book_section_path(conn, :show, book_section)
      end
    end
  end

  defp create_book_section(_) do
    book_section = fixture(:book_section)
    {:ok, book_section: book_section}
  end
end
