defmodule AmnesiaApi.Amnesia.BookSection do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.BookSection

  @timestamps_opts [usec: false]
  schema "book_sections" do
    field :book_id, :id
    field :section_id, :id

    timestamps()
  end

  @doc false
  def changeset(%BookSection{} = book_section, attrs) do
    book_section
    |> cast(attrs, [:book_id, :section_id])
    |> validate_required([:book_id, :section_id])
    |> foreign_key_constraint(:book_id)
    |> foreign_key_constraint(:section_id)
  end
end
