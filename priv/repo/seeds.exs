# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     IChing.Repo.insert!(%IChing.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Code.require_file("priv/repo/seeds/hexagrams.exs")
Code.require_file("priv/repo/seeds/judgements.exs")
Code.require_file("priv/repo/seeds/images.exs")

defmodule Seeds do
  alias IChing.Repo
  alias IChing.Hexagram

  def clear_all, do: Enum.each [Hexagram], &Repo.delete_all(&1)

  def import_all do
    Seeds.import_hexagrams(IChing.Seeds.Hexagrams.hexagrams)
    Seeds.import_judgements(IChing.Seeds.Judgements.judgements |> Enum.with_index)
    Seeds.import_images(IChing.Seeds.Images.images |> Enum.with_index)
  end

  def import_hexagrams([]), do: nil
  def import_hexagrams([hexagram | rest]) do
    import_hexagram(hexagram)
    import_hexagrams(rest)
  end

  defp import_hexagram({king_wen_number, binary, english_name, chinese_name, characters}) do
    Repo.insert!(%Hexagram{
          king_wen_number: king_wen_number,
          binary: binary,
          english_name: english_name,
          chinese_name: chinese_name,
          characters: characters})
  end

  def import_judgements([]), do: nil
  def import_judgements([{judgement, index} | rest]) do
    import_judgement(judgement, index)
    import_judgements(rest)
  end

  def import_judgement(content, index) do
    king_wen_number = index + 1
    hexagram = Repo.get!(Hexagram, king_wen_number)
    hexagram
    |> Ecto.Model.build(:judgement, %{content: content})
    |> Repo.insert!()
  end

  def import_images([]), do: nil
  def import_images([{image, index} | rest]) do
    import_image(image, index)
    import_images(rest)
  end

  def import_image(content, index) do
    king_wen_number = index + 1
    hexagram = Repo.get!(Hexagram, king_wen_number)
    hexagram
    |> Ecto.Model.build(:image, %{content: content})
    |> Repo.insert!()
  end
end

Seeds.clear_all
Seeds.import_all
