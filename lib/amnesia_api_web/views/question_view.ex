defmodule AmnesiaApiWeb.QuestionView do
  use AmnesiaApiWeb, :view
  alias AmnesiaApiWeb.QuestionView

  def render("index.json", %{questions: questions}) do
    %{data: render_many(questions, QuestionView, "question.json")}
  end

  def render("show.json", %{question: question}) do
    %{data: render_one(question, QuestionView, "question.json")}
  end

  def render("question.json", %{question: question}) do
    %{id: question.id,
      text: question.text,
      answers: Enum.map(question.answers, fn(answer) -> AmnesiaApiWeb.AnswerView.render("answer.json", %{answer: answer}) end),
      rating: question.rating}
  end
end
