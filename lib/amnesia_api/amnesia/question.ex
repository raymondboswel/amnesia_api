defmodule AmnesiaApi.Amnesia.Question do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.Question


  schema "questions" do
    field :text, :string
    field :rating, :float
    field :book_id, :id
    has_many :answers, AmnesiaApi.Amnesia.Answer
    timestamps()
  end

  @doc false
  def changeset(%Question{} = question, attrs) do
    question
    |> cast(attrs, [:text, :rating, :book_id])
    |> validate_required([:text])
  end
end
