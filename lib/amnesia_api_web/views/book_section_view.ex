defmodule AmnesiaApiWeb.BookSectionView do
  use AmnesiaApiWeb, :view
  alias AmnesiaApiWeb.BookSectionView

  def render("index.json", %{book_sections: book_sections}) do
    %{data: render_many(book_sections, BookSectionView, "book_section.json")}
  end

  def render("show.json", %{book_section: book_section}) do
    %{data: render_one(book_section, BookSectionView, "book_section.json")}
  end

  def render("book_section.json", %{book_section: book_section}) do
    %{id: book_section.id}
  end
end
