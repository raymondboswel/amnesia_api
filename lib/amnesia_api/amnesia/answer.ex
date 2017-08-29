defmodule AmnesiaApi.Amnesia.Answer do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.Answer


  schema "answers" do
    field :answer, :string
    field :rating, :float
    belongs_to :question, Question

    timestamps()
  end

  @doc false
  def changeset(%Answer{} = answer, attrs) do
    answer
    |> cast(attrs, [:answer, :rating])
    |> validate_required([:answer, :rating])
  end
end
