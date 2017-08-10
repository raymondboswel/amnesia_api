defmodule AmnesiaApi.Repo.Migrations.CreateSectionQuestions do
  use Ecto.Migration

  def change do
    create table(:section_questions) do
      add :section_id, references(:sections, on_delete: :nothing)
      add :question_id, references(:questions, on_delete: :nothing)

      timestamps()
    end

    create index(:section_questions, [:section_id])
    create index(:section_questions, [:question_id])
  end
end
