defmodule AmnesiaApi.Amnesia.ChapterQuestion do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.ChapterQuestion


  schema "chapter_questions" do
    field :chapter_id, :id
    field :question_id, :id

    timestamps()
  end

  @doc false
  def changeset(%ChapterQuestion{} = chapter_question, attrs) do
    chapter_question
    |> cast(attrs, [])
    |> validate_required([])
  end
end
