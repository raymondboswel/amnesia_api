defmodule AmnesiaApi.Amnesia.Book do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Amnesia.Book

  @timestamps_opts [usec: false]
  schema "books" do
    field :subtitle, :string
    field :title, :string
    field :summary, :string
    field :google_id, :string
    field :cover_url, :string
    belongs_to :user, AmnesiaApi.Accounts.User
    many_to_many :authors, AmnesiaApi.Amnesia.Author, join_through: "book_authors"
    many_to_many :sections, AmnesiaApi.Amnesia.Section, join_through: "book_sections"

    timestamps()
  end

  @doc false
  def changeset(%Book{} = book, attrs) do
    book
    |> cast(attrs, [:title, :subtitle, :summary, :user_id, :google_id, :cover_url])
    |> validate_required([:title, :google_id])
    |> foreign_key_constraint(:user_id)
  end
end
