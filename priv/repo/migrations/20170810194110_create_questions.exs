defmodule AmnesiaApi.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :question, :string
      add :rating, :float

      timestamps()
    end

  end
end
