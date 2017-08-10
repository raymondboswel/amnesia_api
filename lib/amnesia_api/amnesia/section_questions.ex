defmodule AmnesiaApi.Amnesia.SectionQuestions do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.SectionQuestions


  schema "section_questions" do
    field :section_id, :id
    field :question_id, :id

    timestamps()
  end

  @doc false
  def changeset(%SectionQuestions{} = section_questions, attrs) do
    section_questions
    |> cast(attrs, [])
    |> validate_required([])
  end
end
