defmodule NftexWeb.ArtsView do
  use NftexWeb, :view

  def render("arts.json", %{data: %{arts: arts}}) do
    %{arts: render_many(arts, NftexWeb.ArtsView, "art.json", as: :art)}
  end

  def render("art.json", %{art: art}) do
    %{
      id: art.id,
      description: art.description,
      hash: art.hash
    }
  end
end
