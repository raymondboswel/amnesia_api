defmodule AmnesiaApiWeb.BookAuthorsControllerTest do
  use AmnesiaApiWeb.ConnCase

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.BookAuthors

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:book_authors) do
    {:ok, book_authors} = Amnesia.create_book_authors(@create_attrs)
    book_authors
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all book_authors", %{conn: conn} do
      conn = get conn, book_authors_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create book_authors" do
    test "renders book_authors when data is valid", %{conn: conn} do
      conn = post conn, book_authors_path(conn, :create), book_authors: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, book_authors_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, book_authors_path(conn, :create), book_authors: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update book_authors" do
    setup [:create_book_authors]

    test "renders book_authors when data is valid", %{conn: conn, book_authors: %BookAuthors{id: id} = book_authors} do
      conn = put conn, book_authors_path(conn, :update, book_authors), book_authors: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, book_authors_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, book_authors: book_authors} do
      conn = put conn, book_authors_path(conn, :update, book_authors), book_authors: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete book_authors" do
    setup [:create_book_authors]

    test "deletes chosen book_authors", %{conn: conn, book_authors: book_authors} do
      conn = delete conn, book_authors_path(conn, :delete, book_authors)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, book_authors_path(conn, :show, book_authors)
      end
    end
  end

  defp create_book_authors(_) do
    book_authors = fixture(:book_authors)
    {:ok, book_authors: book_authors}
  end
end
