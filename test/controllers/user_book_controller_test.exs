defmodule AmnesiaApi.UserBookControllerTest do
  use AmnesiaApi.ConnCase

  alias AmnesiaApi.UserBook
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, user_book_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    user_book = Repo.insert! %UserBook{}
    conn = get conn, user_book_path(conn, :show, user_book)
    assert json_response(conn, 200)["data"] == %{"id" => user_book.id,
      "user_id" => user_book.user_id,
      "book_id" => user_book.book_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, user_book_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, user_book_path(conn, :create), user_book: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(UserBook, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, user_book_path(conn, :create), user_book: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    user_book = Repo.insert! %UserBook{}
    conn = put conn, user_book_path(conn, :update, user_book), user_book: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(UserBook, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    user_book = Repo.insert! %UserBook{}
    conn = put conn, user_book_path(conn, :update, user_book), user_book: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    user_book = Repo.insert! %UserBook{}
    conn = delete conn, user_book_path(conn, :delete, user_book)
    assert response(conn, 204)
    refute Repo.get(UserBook, user_book.id)
  end
end
