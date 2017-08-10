defmodule AmnesiaApi.Repo.Migrations.CreateSections do
  use Ecto.Migration

  def change do
    create table(:sections) do
      add :name, :string

      timestamps()
    end

  end
end
