defmodule Bitly.Helpers do
  alias Bitly.Client

  @doc """
  1. Errors return Bitly.Error struct
  %Bitly.Errors{
    description: "",
    errors: [%{"error_code" => "", "field" => "field_name"}],
    message: "",
    resource: ""
  }
  """
  def get_response_body(client, path, body, module) do
    {:ok, %{body: body}} = Client.get(client, path, body)
    case Map.has_key?(body, "description") do
      true ->
        # Found errors so return error message
        body = map_to_struct(body)
        errors = struct(Bitly.Errors, body)
        {:error, errors}
      false ->
        results = handle_response_body(body, module)
        {:ok, results}
    end

  end

    @doc """
  1. Errors return Bitly.Error struct
  %Bitly.Errors{
    description: "",
    errors: [%{"error_code" => "", "field" => "field_name"}],
    message: "",
    resource: ""
  }
  """
  def post(client, path, request_body, module) do
    {:ok, %{body: body}} = Client.post(client, path, request_body)
    case Map.has_key?(body, "errors") do
      true ->
        # Response body has Errors
        body = map_to_struct(body)
        errors = struct(Bitly.Errors, body)
        {:error, errors}
      false->
        results = handle_response_body(body, module)
        {:ok, results}
    end
  end

  def handle_response_body(body, module) do
    body = map_to_struct(body)
    struct(module, body)
  end

  def map_to_struct(map) do
    for {key, value} <- map, into: %{} do
      {String.to_existing_atom(key), value}
    end
  end
end
