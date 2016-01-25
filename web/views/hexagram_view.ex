defmodule IChing.HexagramView do
  use IChing.Web, :view

  def render_with_linebreaks(str) do
    str
    |> String.replace("\n", "<br />", [])
    |> raw
  end

  def render("index.json", %{hexagrams: hexagrams}) do
    render_many(hexagrams, IChing.HexagramView, "hexagram_basic.json")
  end

  def render("show.json", %{hexagram: hexagram}) do
    render_one(hexagram, IChing.HexagramView, "hexagram.json")
  end

  def render("hexagram_basic.json", %{hexagram: hexagram}) do
    %{
      english_name: hexagram.english_name,
      chinese_name: hexagram.chinese_name,
      king_wen_number: hexagram.king_wen_number
    }
  end

  def render("hexagram.json", %{hexagram: hexagram}) do
    %{
      english_name: hexagram.english_name,
      chinese_name: hexagram.chinese_name,
      king_wen_number: hexagram.king_wen_number,
      characters: hexagram.characters,
      judgement: hexagram.judgement.content,
      image: hexagram.image.content
    }
  end
end
