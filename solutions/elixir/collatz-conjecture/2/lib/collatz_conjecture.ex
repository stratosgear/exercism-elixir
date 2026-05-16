defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input > 0 do
    collatz(input, 0)
  end

  defp collatz(1, steps), do: steps

  defp collatz(n, steps) do
    case rem(n, 2) do
      0 -> collatz(div(n, 2), steps + 1)
      1 -> collatz(n * 3 + 1, steps + 1)
    end
  end
end
