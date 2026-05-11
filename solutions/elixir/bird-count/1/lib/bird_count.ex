defmodule BirdCount do
  def today(list) do
    # Please implement the today/1 function
    # Returns the number of birds seen today
    List.first(list)
  end

  def increment_day_count([]) do
    # Please implement the increment_day_count/1 function
    # Increments the count of birds seen today
    [1]
  end
  def increment_day_count(list) do
    # Please implement the increment_day_count/1 function
    # Increments the count of birds seen today
    [today(list) + 1 | List.delete_at(list, 0)]
  end

  def has_day_without_birds?(list) do
    # Please implement the has_day_without_birds?/1 function
    #
    Enum.any?(list, fn x -> x == 0 end)
  end

  def total(list) do
    # Please implement the total/1 function
    Enum.sum(list)
  end

  def busy_days(list) do
    # Please implement the busy_days/1 function
    Enum.count(list, fn x -> x >= 5 end)
  end
end
