defmodule BirdCount do
  def today([]) do
    nil
  end

  def today(list) do
     # List.first(list)
    hd(list)
  end

  def increment_day_count([]) do
    [1]
  end
  def increment_day_count(list) do
    # [today(list) + 1 | List.delete_at(list, 0)]
    [today(list) + 1 | tl(list)]
  end

  def has_day_without_birds?([]) do
    false
  end

  def has_day_without_birds?(list) do
    # Enum.any?(list, fn x -> x == 0 end)
    cond do
      hd(list) == 0 -> true
      true -> has_day_without_birds?(tl(list))
    end
  end

  def total([]) do
    0
  end

  def total(list) do
    # Enum.sum(list)
    hd(list) + total(tl(list))
  end

  def busy_days([]) do
    0
  end

  def busy_days(list) do
    # Enum.count(list, fn x -> x >= 5 end)
    cond do
      hd(list) >= 5 -> 1 + busy_days(tl(list))
      true -> busy_days(tl(list))
    end
  end
end
