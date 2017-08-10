defmodule AmnesiaApi.Repo.Migrations.CreateChapters do
  use Ecto.Migration

  def change do
    create table(:chapters) do
      add :name, :string
      add :book_id, references(:books, on_delete: :nothing)

      timestamps()
    end

    create index(:chapters, [:book_id])
  end
end
