defmodule AmnesiaApi.Amnesia.Book do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.Book


  schema "books" do
    field :subtitle, :string
    field :title, :string
    many_to_many :user, AmnesiaApi.Accounts.User, join_through: "user_books"

    timestamps()
  end

  @doc false
  def changeset(%Book{} = book, attrs) do
    book
    |> cast(attrs, [:title, :subtitle])
    |> validate_required([:title, :subtitle])
  end
end
