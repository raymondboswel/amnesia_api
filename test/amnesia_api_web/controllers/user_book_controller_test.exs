defmodule AmnesiaApiWeb.UserBookControllerTest do
  use AmnesiaApiWeb.ConnCase

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.UserBook
  alias AmnesiaApi.Accounts

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{book_id: 543, user_id: 345}

  def fixture(:user_book, user, book) do
    {:ok, user_book} = Amnesia.create_user_book(%{user_id: user.id, book_id: book.id})
    user_book
  end

  def fixture(:book) do
    {:ok, book } = Amnesia.create_book(%{title: "test", subtitle: "test subtitle", google_id: "1234", cover_url: "http://fake_url"})
    book
  end

  def fixture(:user) do
    {:ok, user } = Accounts.create_user(%{name: "test user", surname: "test surname", email: "email", password_hash: "passwordhash"})
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all user_books", %{conn: conn} do
      conn = get conn, user_book_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user_book" do
    test "renders user_book when data is valid", %{conn: conn} do
      user = fixture(:user)
      book = fixture(:book)

      conn = post conn, user_book_path(conn, :create), %{user_book: %{user_id: user.id, book_id: book.id}}
      book_id = book.id
      user_id = user.id
      assert %{"book_id" => ^book_id, "user_id" => ^user_id} = json_response(conn, 201)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, user_book_path(conn, :create), user_book: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user_book" do
    setup [:create_user_book]

    test "renders user_book when data is valid", %{conn: conn, user_book: %UserBook{id: id} = user_book} do
      book_id = user_book.book_id
      conn = put conn, user_book_path(conn, :update, user_book), user_book: @update_attrs
      assert %{"book_id" => ^book_id} = json_response(conn, 200)["data"]

      conn = get conn, user_book_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{"book_id" => user_book.book_id, "user_id" => user_book.user_id}
    end

    test "renders errors when data is invalid", %{conn: conn, user_book: user_book} do
      conn = put conn, user_book_path(conn, :update, user_book), user_book: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user_book" do
    setup [:create_user_book]

    test "deletes chosen user_book", %{conn: conn, user_book: user_book} do
      conn = delete conn, "/api/user_books", %{user_id: user_book.user_id, book_id: user_book.book_id}
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, user_book_path(conn, :show, user_book)
      end
    end
  end

  defp create_user_book(_) do
    user = fixture(:user)
    book = fixture(:book)
    user_book = fixture(:user_book, user, book)
    {:ok, user_book: user_book}
  end
end
