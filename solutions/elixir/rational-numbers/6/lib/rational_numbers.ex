import Kernel, except: [abs: 1]

defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    {{a1, b1}, {a2, b2}} = {a, b}
    reduce({a1 * b2 + a2 * b1, b1 * b2})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
      {{a1, b1}, {a2, b2}} = {a, b}
      reduce({a1 * b2 - a2 * b1, b1 * b2})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    {{a1, b1}, {a2, b2}} = {a, b}
    reduce({a1*a2, b1*b2})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    {{a1, b1}, {a2, b2}} = {num, den}
    cond do
      a2 != 0 ->
        reduce({a1 * b2, a2 * b1})
      true -> :undefined
    end
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {a1, b1} = a
    reduce({Kernel.abs(a1), Kernel.abs(b1)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) do
    {a1, b1} = a
    cond do
      n >= 0 -> reduce({round(:math.pow(a1, n)), round(:math.pow(b1, n))})
      n < 0 -> reduce({round(:math.pow(b1, -n)), round(:math.pow(a1, -n))})
    end
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    {a1, b1} = n
    :math.sqrt(:math.pow(x, a1), b1)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
    {a1, b1} = a
    g = Integer.gcd(a1, b1)
    {div(a1, g),  div(b1 , g)}
  end

  def reduce({a, b}) when b < 0 do
    reduce({-a, -b})
  end

end
