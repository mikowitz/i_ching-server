defmodule IChing.Repo.Migrations.CreateHexagram do
  use Ecto.Migration

  def change do
    create table(:hexagrams, primary_key: false) do
      add :king_wen_number, :integer, primary_key: true
      add :english_name, :string
      add :chinese_name, :string
      add :characters, :string
      add :binary, :integer

      timestamps
    end

    create unique_index(:hexagrams, [:king_wen_number])
  end
end
