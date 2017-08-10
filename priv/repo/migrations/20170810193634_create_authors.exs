defmodule AmnesiaApi.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string
      add :surname, :string

      timestamps()
    end

  end
end
