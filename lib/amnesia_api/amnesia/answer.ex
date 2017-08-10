defmodule AmnesiaApi.Amnesia.Answer do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.Answer


  schema "answers" do
    field :answer, :string
    field :rating, :float
    field :question_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Answer{} = answer, attrs) do
    answer
    |> cast(attrs, [:answer, :rating])
    |> validate_required([:answer, :rating])
  end
end
