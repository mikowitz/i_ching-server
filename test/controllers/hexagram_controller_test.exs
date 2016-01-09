defmodule IChing.HexagramControllerTest do
  use IChing.ConnCase

  setup do
    hexagram = insert_hexagram()
    {:ok, conn: conn, hexagram: hexagram}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, hexagram_path(conn, :index)
    assert html_response(conn, 200) =~ "Hexagrams"
  end

  test "shows chosen resource", %{conn: conn, hexagram: hexagram} do
    conn = get conn, hexagram_path(conn, :show, hexagram)
    assert html_response(conn, 200) =~ "english name"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, hexagram_path(conn, :show, -1)
    end
  end
end
