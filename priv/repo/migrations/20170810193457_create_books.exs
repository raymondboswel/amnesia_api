defmodule AmnesiaApi.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :subtitle, :string
      add :summary, :string
      add :google_id, :string
      add :cover_url, :string
      add :user_id, references(:users, on_delete: :nothing)
      timestamps()
    end

    create index(:books, [:user_id])

  end
end
