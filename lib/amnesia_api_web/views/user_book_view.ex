defmodule AmnesiaApiWeb.UserBookView do
  use AmnesiaApiWeb, :view
  alias AmnesiaApiWeb.UserBookView
  alias AmnesiaApiWeb.BookView

  def render("index.json", %{user_books: user_books}) do
    %{data: render_many(user_books, UserBookView, "user_book.json")}
  end

  def render("user_books.json", %{all_user_books: user_books}) do
    %{data: render_many(user_books, BookView, "book.json")}
  end

  def render("show.json", %{user_book: user_book}) do
    %{data: render_one(user_book, UserBookView, "user_book.json")}
  end

  def render("user_book.json", %{user_book: user_book}) do
    %{user_id: user_book.user_id, book_id: user_book.book_id}
  end
end
