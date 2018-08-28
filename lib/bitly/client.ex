defmodule Bitly.Client do
  use Tesla

  @type t :: Tesla.Client.t()

  @default_base_url "https://api-ssl.bitly.com/v4"

  @spec new(keyword) :: Tesla.Client.t()
  def new(attrs \\ []) do
    base_url = attrs[:base_url] || @default_base_url
    access_token = attrs[:access_token] || Application.get_env(:bitly, :access_token)

    Tesla.build_client([
      {Tesla.Middleware.Headers, [ {"user-agent", "Bitly-Elixir"}, {"Authorization", "Bearer #{access_token}"} ] },
      {Tesla.Middleware.BaseUrl, base_url},
      Tesla.Middleware.JSON
    ])
  end
end
