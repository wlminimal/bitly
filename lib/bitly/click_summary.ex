defmodule Bitly.ClickSummary do
  alias Bitly.{Client, Helpers}

  defstruct [:units, :unit, :total_clicks, :unit_reference]

  @type t :: %__MODULE__{
    total_clicks: integer,
    unit: String.t(),
    unit_reference: String.t(),
    units: integer
  }

  @spec click_summary(String.t(), Client.t()) :: t
  def click_summary(bitlink, client \\ Client.new()) do
    Helpers.get_response_body(client, "/bitlinks/#{bitlink}/clicks/summary", [], __MODULE__)
  end

end
