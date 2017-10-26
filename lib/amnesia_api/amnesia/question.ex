defmodule AmnesiaApi.Amnesia.Question do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.Question

  @timestamps_opts [usec: false]
  schema "questions" do
    field :text, :string
    field :rating, :float
    field :book_id, :id
    has_many :answers, AmnesiaApi.Amnesia.Answer
    many_to_many :sections, AmnesiaApi.Amnesia.Section, join_through: "section_questions"
    timestamps()
  end

  @doc false
  def changeset(%Question{} = question, attrs) do
    question
    |> cast(attrs, [:text, :rating, :book_id])
    |> validate_required([:text])
    |> foreign_key_constraint(:book_id)
  end
end
