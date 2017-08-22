defmodule AmnesiaApi.Amnesia.UserBook do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.UserBook


  schema "user_books" do
    field :user_id, :id
    field :book_id, :id

    timestamps()
  end

  @doc false
  def changeset(%UserBook{} = user_book, attrs) do
    user_book
    |> cast(attrs, [:user_id, :book_id])
    |> validate_required([:user_id, :book_id])
  end
end
