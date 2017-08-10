defmodule AmnesiaApiWeb.ChapterQuestionView do
  use AmnesiaApiWeb, :view
  alias AmnesiaApiWeb.ChapterQuestionView

  def render("index.json", %{chapter_questions: chapter_questions}) do
    %{data: render_many(chapter_questions, ChapterQuestionView, "chapter_question.json")}
  end

  def render("show.json", %{chapter_question: chapter_question}) do
    %{data: render_one(chapter_question, ChapterQuestionView, "chapter_question.json")}
  end

  def render("chapter_question.json", %{chapter_question: chapter_question}) do
    %{id: chapter_question.id}
  end
end
