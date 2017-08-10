defmodule AmnesiaApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias AmnesiaApi.Accounts.User


  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :salt, :string
    field :surname, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :surname, :email, :password_hash, :salt])
    |> validate_required([:name, :surname, :email, :password_hash, :salt])
  end
end
