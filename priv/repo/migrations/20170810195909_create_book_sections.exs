defmodule AmnesiaApi.Repo.Migrations.CreateBookSections do
  use Ecto.Migration

  def change do
    create table(:book_sections) do
      add :book_id, references(:books, on_delete: :nothing)
      add :section_id, references(:sections, on_delete: :nothing)

      timestamps()
    end

    create index(:book_sections, [:book_id])
    create index(:book_sections, [:section_id])
  end
end
