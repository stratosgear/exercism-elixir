defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
  r = (x*x + y*y) ** 0.5
  cond do
    r > 10.0 -> 0
    r > 5.0 -> 1
    r > 1.0 -> 5
    true -> 10
  end
end
end
