defmodule KitchenCalculator do
  def get_volume({_unit, vol}) do
    vol
  end

  def to_milliliter({:cup, vol}) do
    {:milliliter, vol * 240}
  end
  def to_milliliter({:fluid_ounce, vol}) do
    {:milliliter, vol * 30}
  end
  def to_milliliter({:teaspoon, vol}) do
    {:milliliter, vol * 5}
  end
  def to_milliliter({:tablespoon, vol}) do
    {:milliliter, vol * 15}
  end
  def to_milliliter({:milliliter, vol}) do
    {:milliliter, vol}
  end
  
  def from_milliliter({:milliliter, vol}, unit) do
    cond do
      unit == :cup -> 
        {unit, vol / 240.0}
      unit == :fluid_ounce -> 
        {unit, vol / 30.0}
      unit == :teaspoon -> 
        {unit, vol / 5.0}
      unit == :tablespoon ->
        {unit, vol / 15.0}
      unit == :milliliter -> 
        {unit, vol}
      true -> 
        {unit, :cannot_convert}
    end
  end

  def convert({from, vol}, to) do
    {_, vol_in_ml} = to_milliliter({from, vol})
    from_milliliter({:milliliter, vol_in_ml}, to)
  end
end
