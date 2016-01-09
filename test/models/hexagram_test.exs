defmodule IChing.HexagramTest do
  use IChing.ModelCase

  alias IChing.Hexagram

  @valid_attrs %{binary: 42, characters: "some content", chinese_name: "some content", english_name: "some content", king_wen_number: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Hexagram.changeset(%Hexagram{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Hexagram.changeset(%Hexagram{}, @invalid_attrs)
    refute changeset.valid?
  end
end
