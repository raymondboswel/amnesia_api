defmodule AmnesiaApiWeb.BookAuthorsControllerTest do
  use AmnesiaApiWeb.ConnCase

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.BookAuthors

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:book_authors, book, author) do
    {:ok, book_authors} = Amnesia.create_book_authors(%{book_id: book.id, author_id: author.id})
    book_authors
  end

  def fixture(:book) do
    {:ok, book } = Amnesia.create_book(%{title: "test", subtitle: "test subtitle"})
    book
  end

  def fixture(:author) do
    {:ok, author } = Amnesia.create_author(%{name: "test name", surname: "surname"})
    author
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
      book = fixture(:book)
      author = fixture(:author)
      conn = post conn, book_authors_path(conn, :create), book_authors: %{book_id: book.id, author_id: author.id}
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
      conn = put conn, book_authors_path(conn, :update, book_authors), book_authors: %{book_id: 122}
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
    book = fixture(:book)
    author = fixture(:author)
    book_authors = fixture(:book_authors, book, author)
    {:ok, book_authors: book_authors}
  end
end

