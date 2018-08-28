defmodule Bitly.Link do
    @moduledoc """
  Bitly Links API

  <https://dev.bitly.com/links.html>
  """

  alias Bitly.Client
  alias Bitly.Helpers
  alias UUID

  defstruct [:archived,
             :created_at,
             :custom_bitlinks,
             :deeplinks,
             :id,
             :link,
             :long_url,
             :references,
             :tags]

  @type t :: %__MODULE__{
    archived: boolean,
    created_at: String.t(),
    custom_bitlinks: list,
    deeplinks: list,
    id: String.t(),
    link: String.t(),
    long_url: String.t(),
    references: map,
    tags: list
  }


  @spec shorten(String.t(), keyword, Client.t()) :: t | String.t()
  def shorten(long_url, domain \\ "bit.ly", group_guid \\ System.get_env("BITLY_GROUP_ID"), client \\ Client.new()) do
    # Add UUID to long url to get unique bitlink.
    unique_param = UUID.uuid4(:hex)
    long_url = long_url <> "/?" <> unique_param
    Helpers.post(client, "/shorten", %{long_url: long_url, domain: domain, group_guid: group_guid}, __MODULE__)
  end
end
