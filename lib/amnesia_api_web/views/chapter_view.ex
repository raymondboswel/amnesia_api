defmodule AmnesiaApiWeb.ChapterView do
  use AmnesiaApiWeb, :view
  alias AmnesiaApiWeb.ChapterView

  def render("index.json", %{chapters: chapters}) do
    %{data: render_many(chapters, ChapterView, "chapter.json")}
  end

  def render("show.json", %{chapter: chapter}) do
    %{data: render_one(chapter, ChapterView, "chapter.json")}
  end

  def render("chapter.json", %{chapter: chapter}) do
    %{id: chapter.id,
      name: chapter.name}
  end
end
