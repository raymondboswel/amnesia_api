defmodule AmnesiaApi.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :subtitle, :string

      timestamps()
    end

  end
end
