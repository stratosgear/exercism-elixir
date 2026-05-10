defmodule GuessingGame do

  def compare(_secret \\ 1, guess \\ :no_guess)

  def compare(_secret_number, guess) when guess == :no_guess do
    "Make a guess"
  end
  def compare(secret_number, guess ) when secret_number == guess do
    "Correct"
  end
    def compare(secret_number, guess) when guess < secret_number - 1 do
    "Too low"
  end
    def compare(secret_number, guess ) when guess > secret_number + 1 do
    "Too high"
  end
    def compare(secret_number, guess ) when abs(secret_number - guess) == 1 do
    "So close"
  end

end
