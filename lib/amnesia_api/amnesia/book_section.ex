defmodule AmnesiaApi.Amnesia.BookSection do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.BookSection


  schema "book_sections" do
    field :book_id, :id
    field :section_id, :id

    timestamps()
  end

  @doc false
  def changeset(%BookSection{} = book_section, attrs) do
    book_section
    |> cast(attrs, [])
    |> validate_required([])
  end
end
