defmodule IChing.ImageTest do
  use IChing.ModelCase

  alias IChing.Image

  @valid_attrs %{content: "some content", hexagram_king_wen_number: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Image.changeset(%Image{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Image.changeset(%Image{}, @invalid_attrs)
    refute changeset.valid?
  end
end
