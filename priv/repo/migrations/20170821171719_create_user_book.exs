defmodule AmnesiaApi.Repo.Migrations.CreateUserBook do
  use Ecto.Migration

  def change do
    create table(:user_books) do
      add :user_id, references(:users, on_delete: :nothing)
      add :book_id, references(:books, on_delete: :nothing)

      timestamps()
    end

    create index(:user_books, [:user_id])
    create index(:user_books, [:book_id])
  end
end
