defmodule AmnesiaApiWeb.UserBookView do
  use AmnesiaApiWeb, :view
  alias AmnesiaApiWeb.UserBookView

  def render("index.json", %{user_books: user_books}) do
    %{data: render_many(user_books, UserBookView, "user_book.json")}
  end

  def render("show.json", %{user_book: user_book}) do
    %{data: render_one(user_book, UserBookView, "user_book.json")}
  end

  def render("user_book.json", %{user_book: user_book}) do
    %{id: user_book.id}
  end
end
