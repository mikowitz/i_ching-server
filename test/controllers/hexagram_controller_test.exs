defmodule IChing.HexagramControllerTest do
  use IChing.ConnCase

  alias IChing.Hexagram
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, hexagram_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing hexagrams"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, hexagram_path(conn, :new)
    assert html_response(conn, 200) =~ "New hexagram"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, hexagram_path(conn, :create), hexagram: @valid_attrs
    assert redirected_to(conn) == hexagram_path(conn, :index)
    assert Repo.get_by(Hexagram, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, hexagram_path(conn, :create), hexagram: @invalid_attrs
    assert html_response(conn, 200) =~ "New hexagram"
  end

  test "shows chosen resource", %{conn: conn} do
    hexagram = Repo.insert! %Hexagram{}
    conn = get conn, hexagram_path(conn, :show, hexagram)
    assert html_response(conn, 200) =~ "Show hexagram"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, hexagram_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    hexagram = Repo.insert! %Hexagram{}
    conn = get conn, hexagram_path(conn, :edit, hexagram)
    assert html_response(conn, 200) =~ "Edit hexagram"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    hexagram = Repo.insert! %Hexagram{}
    conn = put conn, hexagram_path(conn, :update, hexagram), hexagram: @valid_attrs
    assert redirected_to(conn) == hexagram_path(conn, :show, hexagram)
    assert Repo.get_by(Hexagram, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    hexagram = Repo.insert! %Hexagram{}
    conn = put conn, hexagram_path(conn, :update, hexagram), hexagram: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit hexagram"
  end

  test "deletes chosen resource", %{conn: conn} do
    hexagram = Repo.insert! %Hexagram{}
    conn = delete conn, hexagram_path(conn, :delete, hexagram)
    assert redirected_to(conn) == hexagram_path(conn, :index)
    refute Repo.get(Hexagram, hexagram.id)
  end
end
