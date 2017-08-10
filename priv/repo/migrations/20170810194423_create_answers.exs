defmodule AmnesiaApi.Repo.Migrations.CreateAnswers do
  use Ecto.Migration

  def change do
    create table(:answers) do
      add :answer, :string
      add :rating, :float
      add :question_id, references(:questions, on_delete: :nothing)

      timestamps()
    end

    create index(:answers, [:question_id])
  end
end
