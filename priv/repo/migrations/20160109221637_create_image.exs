defmodule IChing.Repo.Migrations.CreateImage do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :content, :text
      add :hexagram_king_wen_number, references(:hexagrams, on_delete: :delete_all, column: :king_wen_number)

      timestamps
    end

    create index(:images, [:hexagram_king_wen_number])
  end
end
