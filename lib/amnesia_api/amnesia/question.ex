defmodule AmnesiaApi.Amnesia.Question do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.Question


  schema "questions" do
    field :question, :string
    field :rating, :float

    timestamps()
  end

  @doc false
  def changeset(%Question{} = question, attrs) do
    question
    |> cast(attrs, [:question, :rating])
    |> validate_required([:question, :rating])
  end
end
