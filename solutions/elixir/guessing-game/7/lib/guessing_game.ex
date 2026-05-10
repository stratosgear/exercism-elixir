defmodule GuessingGame do

def compare(secret_number \\ 1, guess \\ :no_guess) do
    do_compare(secret_number, guess)
  end

  defp do_compare(_secret_number, :no_guess), do: "Make a guess"
  defp do_compare(secret, guess) when secret == guess, do: "Correct"
  defp do_compare(secret, guess) when guess < secret - 1, do: "Too low"
  defp do_compare(secret, guess) when guess > secret + 1, do: "Too high"
  defp do_compare(secret, guess) when abs(secret - guess) == 1, do: "So close"

end
