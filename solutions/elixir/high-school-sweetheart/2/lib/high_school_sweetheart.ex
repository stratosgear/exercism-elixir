defmodule HighSchoolSweetheart do
  def first_letter(name) do
    # Please implement the first_letter/1 function
    #
    # strip whitespace and get first letter
    String.first(String.trim(name))
  end

  def initial(name) do
    # Please implement the initial/1 function
    first_letter(name) |> String.upcase() |> Kernel.<>(".")
  end

  def initials(full_name) do
    # Please implement the initials/1 function
    full_name |> String.split() |> Enum.map(&initial/1) |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    # ❤-------------------❤
    # |  X. X.  +  X. X.  |
    # ❤-------------------❤

    # Please implement the pair/2 function
    love_str = full_name1 |> initials() |> Kernel.<>(" + ") |> Kernel.<>(full_name2 |> initials())

    love_len = String.length(love_str) + 2

    "❤" <>
      String.duplicate("-", love_len) <>
      "❤\n" <> "| " <> love_str <> " |\n" <> "❤" <> String.duplicate("-", love_len) <> "❤"
  end
end
