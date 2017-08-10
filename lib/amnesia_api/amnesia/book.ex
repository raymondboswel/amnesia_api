defmodule AmnesiaApi.Amnesia.Book do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.Book


  schema "books" do
    field :subtitle, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Book{} = book, attrs) do
    book
    |> cast(attrs, [:title, :subtitle])
    |> validate_required([:title, :subtitle])
  end
end
