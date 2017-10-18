defmodule AmnesiaApi.Amnesia.Book do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.Book


  schema "books" do
    field :subtitle, :string
    field :title, :string
    field :summary, :string
    many_to_many :user, AmnesiaApi.Accounts.User, join_through: "user_books"
    many_to_many :authors, AmnesiaApi.Amnesia.Author, join_through: "book_authors"
    many_to_many :sections, AmnesiaApi.Amnesia.Section, join_through: "book_sections"

    timestamps()
  end

  @doc false
  def changeset(%Book{} = book, attrs) do
    book
    |> cast(attrs, [:title, :subtitle, :summary])
    |> validate_required([:title, :subtitle])
  end
end
