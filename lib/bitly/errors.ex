defmodule Bitly.Errors do
  defstruct [:description, :errors, :message, :resource]

  @moduledoc """
  description is the main error message
  """
  @type t :: %__MODULE__{
    description: String.t(),
    errors: list,
    message: String.t(),
    resource: String.t()
  }

end
