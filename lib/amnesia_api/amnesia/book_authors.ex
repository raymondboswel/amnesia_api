defmodule AmnesiaApi.Amnesia.BookAuthors do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.BookAuthors

  @timestamps_opts [usec: false]
  schema "book_authors" do
    field :book_id, :id
    field :author_id, :id

    timestamps()
  end

  @doc false
  def changeset(%BookAuthors{} = book_authors, attrs) do
    book_authors
    |> cast(attrs, [:book_id, :author_id])
    |> validate_required([:book_id, :author_id])
    |> foreign_key_constraint(:book_id)
    |> foreign_key_constraint(:author_id)
  end
end
