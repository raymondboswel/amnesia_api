defmodule AmnesiaApiWeb.BookAuthorsView do
  use AmnesiaApiWeb, :view
  alias AmnesiaApiWeb.BookAuthorsView

  def render("index.json", %{book_authors: book_authors}) do
    %{data: render_many(book_authors, BookAuthorsView, "book_authors.json")}
  end

  def render("show.json", %{book_authors: book_authors}) do
    %{data: render_one(book_authors, BookAuthorsView, "book_authors.json")}
  end

  def render("book_authors.json", %{book_authors: book_authors}) do
    %{id: book_authors.id}
  end
end
