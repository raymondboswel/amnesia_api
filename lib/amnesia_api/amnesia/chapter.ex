defmodule AmnesiaApi.Amnesia.Chapter do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.Chapter


  schema "chapters" do
    field :name, :string
    field :book_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Chapter{} = chapter, attrs) do
    chapter
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
