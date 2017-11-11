defmodule AmnesiaApiWeb.BookView do
  use AmnesiaApiWeb, :view
  alias AmnesiaApiWeb.BookView

  def render("index.json", %{books: books}) do
    %{data: render_many(books, BookView, "book.json")}
  end

  def render("show.json", %{book: book}) do
    %{data: render_one(book, BookView, "book.json")}
  end

  def render("book.json", %{book: book}) do
    %{id: book.id,
      title: book.title,
      subtitle: book.subtitle,
      summary: book.summary,
      google_id: book.google_id,
      cover_url: book.cover_url,
      sections: AmnesiaApiWeb.SectionView.render("index.json", %{sections: book.sections})
    }
  end
end
