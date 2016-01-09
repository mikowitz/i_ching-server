defmodule IChing.TestHelpers do
  alias IChing.Repo

  @valid_attrs %{binary: 42, characters: "xx", chinese_name: "chinese name", english_name: "english name", king_wen_number: 42}

  def insert_hexagram(attrs \\ %{}) do
    changeset = Dict.merge(@valid_attrs, attrs)

    %IChing.Hexagram{}
    |> IChing.Hexagram.changeset(changeset)
    |> Repo.insert!()
  end
end
