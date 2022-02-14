defmodule NftexWeb.Resolvers.Art do
  alias Nftex.{Arts, Repo}

  def get(%{id: art_id}, _context), do: Arts.get(art_id)
  def create(%{input: params}, _context), do: Arts.create(params)

  def all(_params, _context), do: {:ok, Repo.all(Art)}
end
