defmodule IChing.Hexagram do
  use IChing.Web, :model

  # NB: binary, when converted to a 6-char base2 representation,
  # has the first line at the left (rotate -90deg to see it in proper order)

  @primary_key {:king_wen_number, :integer, []}
  @derive {Phoenix.Param, key: :king_wen_number}
  schema "hexagrams" do
    field :english_name, :string
    field :chinese_name, :string
    field :characters, :string
    field :binary, :integer

    timestamps
  end

  @required_fields ~w(king_wen_number english_name chinese_name characters binary)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def to_base2(model), do: Integer.to_string(model.binary, 2) |> String.rjust(6, ?0)
end
