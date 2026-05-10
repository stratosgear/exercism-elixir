defmodule Secrets do
  
  def secret_add(secret) do
      &(&1 + secret)
  end

  def secret_subtract(secret) do
      &(&1 - secret)
  end

  def secret_multiply(secret) do
      &(&1 * secret)
  end

  def secret_divide(secret) do
      &(Integer.floor_div(&1,secret))
  end

  def secret_and(secret) do
      &(Bitwise.band(&1, secret))
  end

  def secret_xor(secret) do
      &(Bitwise.bxor(&1, secret))
  end

  def secret_combine(f1, f2) do
      &(f2.(f1.(&1)))
  end

end