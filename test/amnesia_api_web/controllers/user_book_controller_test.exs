defmodule AmnesiaApiWeb.UserBookControllerTest do
  use AmnesiaApiWeb.ConnCase

  alias AmnesiaApi.Amnesia
  alias AmnesiaApi.Amnesia.UserBook

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:user_book) do
    {:ok, user_book} = Amnesia.create_user_book(@create_attrs)
    user_book
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
      conn = post conn, user_book_path(conn, :create), user_book: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, user_book_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, user_book_path(conn, :create), user_book: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user_book" do
    setup [:create_user_book]

    test "renders user_book when data is valid", %{conn: conn, user_book: %UserBook{id: id} = user_book} do
      conn = put conn, user_book_path(conn, :update, user_book), user_book: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, user_book_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, user_book: user_book} do
      conn = put conn, user_book_path(conn, :update, user_book), user_book: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user_book" do
    setup [:create_user_book]

    test "deletes chosen user_book", %{conn: conn, user_book: user_book} do
      conn = delete conn, user_book_path(conn, :delete, user_book)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, user_book_path(conn, :show, user_book)
      end
    end
  end

  defp create_user_book(_) do
    user_book = fixture(:user_book)
    {:ok, user_book: user_book}
  end
end
