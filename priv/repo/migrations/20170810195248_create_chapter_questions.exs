defmodule AmnesiaApi.Repo.Migrations.CreateChapterQuestions do
  use Ecto.Migration

  def change do
    create table(:chapter_questions) do
      add :chapter_id, references(:chapters, on_delete: :nothing)
      add :question_id, references(:questions, on_delete: :nothing)

      timestamps()
    end

    create index(:chapter_questions, [:chapter_id])
    create index(:chapter_questions, [:question_id])
  end
end
