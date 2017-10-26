defmodule AmnesiaApi.Amnesia.Answer do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.Answer

  @timestamps_opts [usec: false]
  schema "answers" do
    field :answer, :string
    field :rating, :float
    belongs_to :question, Question

    timestamps()
  end

  @doc false
  def changeset(%Answer{} = answer, attrs) do
    answer
    |> cast(attrs, [:answer, :rating, :question_id])
    |> validate_required([:answer])
  end
end
