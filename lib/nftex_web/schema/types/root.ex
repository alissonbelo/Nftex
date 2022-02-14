defmodule NftexWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias NftexWeb.Schema.Types
  alias NftexWeb.Resolvers.Art, as: ArtResolver
  alias NftexWeb.Middlewares.Log
  alias Nftex.{Art, Repo}


  import_types Types.Art
  import_types Types.Custom.UUID4

  object :root_query do
    @desc "Get art by id"
    field :art, type: :art do
      arg :id, non_null(:uuid4)

      resolve &ArtResolver.get/2
      middleware Log
    end

    field :arts, list_of(:art) do
      resolve fn _params, _context ->
        {:ok, Repo.all(Art)}
      end
    end
  end

  object :root_mutation do
    @desc "Creates a new art"
    field :create_art, type: :art do
      arg :input, non_null(:creat_art_input)

      resolve &ArtResolver.create/2
      middleware Log
      end
    end
end
