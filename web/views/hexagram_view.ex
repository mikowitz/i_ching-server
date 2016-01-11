defmodule IChing.HexagramView do
  use IChing.Web, :view

  def render_with_linebreaks(str) do
    str
    |> String.replace("\n", "<br />", [])
    |> raw
  end
end
