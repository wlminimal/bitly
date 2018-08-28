defmodule Bitly.Expand do

  alias Bitly.Client
  alias Bitly.Helpers

  defstruct [:created_at, :id, :link, :long_url]

  @type t :: %__MODULE__{
    created_at: String.t(),
    id: integer,
    link: String.t(),
    long_url: String.t()
  }

  @spec expand(String.t(), String.t(), Client.t()) :: t
  def expand(bitlink_id, domain, client \\ Client.new) do
    request_body = %{bitlink_id: bitlink_id, domain: domain}
    Helpers.post(client, "/expand", request_body, __MODULE__)
  end
end
