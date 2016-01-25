defmodule IChing.HexagramController do
  use IChing.Web, :controller

  alias IChing.Hexagram

  def index(conn, _params) do
    hexagrams = Repo.all(Hexagram)
    render(conn, hexagrams: hexagrams)
  end

  def show(conn, %{"id" => id}) do
    hexagram = Repo.get!(Hexagram, id)
    |> Repo.preload([:judgement, :image])
    render(conn, hexagram: hexagram)
  end
end
