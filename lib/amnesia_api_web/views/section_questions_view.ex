defmodule AmnesiaApiWeb.SectionQuestionsView do
  use AmnesiaApiWeb, :view
  alias AmnesiaApiWeb.SectionQuestionsView

  def render("index.json", %{section_questions: section_questions}) do
    %{data: render_many(section_questions, SectionQuestionsView, "section_questions.json")}
  end

  def render("show.json", %{section_questions: section_questions}) do
    %{data: render_one(section_questions, SectionQuestionsView, "section_questions.json")}
  end

  def render("section_questions.json", %{section_questions: section_questions}) do
    %{id: section_questions.id}
  end
end
