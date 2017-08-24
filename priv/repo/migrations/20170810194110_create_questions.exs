defmodule AmnesiaApi.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :text, :string
      add :rating, :float
      add :book_id, references(:books, on_delete: :nothing)
      timestamps()
    end

  end
end
