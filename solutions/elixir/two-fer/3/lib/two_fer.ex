defmodule TwoFer do
  @moduledoc """
  The phrase "two-fer" often implies a two-for-one offer.
  """

  @doc """
  Two-fer or 2-fer is short for two for one. One for you and one for me.
  """
  @spec two_fer(String.t()) :: String.t()
  def two_fer(name \\ "you") when is_binary(name) do
    "One for #{name}, one for me."
  end
end
