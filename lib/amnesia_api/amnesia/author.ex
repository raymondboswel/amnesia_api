defmodule AmnesiaApi.Amnesia.Author do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.Author


  schema "authors" do
    field :name, :string
    field :surname, :string

    timestamps()
  end

  @doc false
  def changeset(%Author{} = author, attrs) do
    author
    |> cast(attrs, [:name, :surname])
    |> validate_required([:name, :surname])
  end
end
