defmodule IChing.IChingTest do
  use ExUnit.Case
  use ApplesAndOranges

  use Hound.Helpers
  hound_session

  test "should create hexagram line elements correctly" do
    navigate_to("/hexagrams/1")
    hexagram = find_element(:id, "hexagram")
    rows = find_all_within_element(hexagram, :class, "row")
    assert 6 == Enum.count(rows)
    rows |> Enum.with_index |> Enum.map fn {row, index} ->
      assert "row-" <> Integer.to_string(6 - index) == attribute_value(row, "id")
    end
  end

  test "loads the index correctly", context do
    navigate_to("/")
    it_looks_like(context, "the index")
  end

  test "taking screenshot", context do
    navigate_to("/hexagrams/1")
    it_looks_like(context, "a hexagram page")
  end
end
