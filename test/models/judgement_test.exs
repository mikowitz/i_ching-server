defmodule IChing.JudgementTest do
  use IChing.ModelCase

  alias IChing.Judgement

  @valid_attrs %{content: "some content", hexagram_king_wen_number: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Judgement.changeset(%Judgement{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Judgement.changeset(%Judgement{}, @invalid_attrs)
    refute changeset.valid?
  end
end
