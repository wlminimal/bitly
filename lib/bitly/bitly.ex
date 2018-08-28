defmodule Bitly.Bitly do
  alias Bitly.{ClickSummary, Link, Client}

  defdelegate click_summary(bitlink, client \\ Client.new()), to: ClickSummary
  defdelegate shorten(long_url, domain \\ "bit.ly", group_guid \\ System.get_env("BITLY_GROUP_ID"), client \\ Client.new()), to: Link
end
