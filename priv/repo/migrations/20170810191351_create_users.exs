defmodule AmnesiaApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :surname, :string
      add :email, :string
      add :password_hash, :string
      add :salt, :string

      timestamps()
    end
    
    create unique_index(:users, [:email])

  end
end
