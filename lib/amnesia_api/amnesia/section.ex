defmodule AmnesiaApi.Amnesia.Section do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.Section


  schema "sections" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Section{} = section, attrs) do
    section
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
