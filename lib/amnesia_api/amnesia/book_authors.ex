defmodule AmnesiaApi.Amnesia.BookAuthors do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.BookAuthors


  schema "book_authors" do
    field :book_id, :id
    field :author_id, :id

    timestamps()
  end

  @doc false
  def changeset(%BookAuthors{} = book_authors, attrs) do
    book_authors
    |> cast(attrs, [])
    |> validate_required([])
  end
end
