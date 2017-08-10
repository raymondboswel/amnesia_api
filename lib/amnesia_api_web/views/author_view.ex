defmodule AmnesiaApiWeb.AuthorView do
  use AmnesiaApiWeb, :view
  alias AmnesiaApiWeb.AuthorView

  def render("index.json", %{authors: authors}) do
    %{data: render_many(authors, AuthorView, "author.json")}
  end

  def render("show.json", %{author: author}) do
    %{data: render_one(author, AuthorView, "author.json")}
  end

  def render("author.json", %{author: author}) do
    %{id: author.id,
      name: author.name,
      surname: author.surname}
  end
end
