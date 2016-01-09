defmodule IChing.Repo.Migrations.CreateJudgement do
  use Ecto.Migration

  def change do
    create table(:judgements) do
      add :content, :text
      add :hexagram_king_wen_number, references(:hexagrams, on_delete: :delete_all, column: :king_wen_number)

      timestamps
    end

    create index(:judgements, [:hexagram_king_wen_number])
  end
end
