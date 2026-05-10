defmodule LogLevel do

  #
  
  def to_label(level, legacy?) do
   levels = [:trace, :debug, :info, :warning, :error, :fatal] 
    cond do
      level < 0 -> :unknown
      level > 5 -> :unknown
      legacy? ->  cond do
                        level == 0 -> :unknown
                        level == 5 -> :unknown
                        true -> Enum.at(levels, level)
                      end
      not legacy? -> Enum.at(levels, level)
    end
  end
    

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    cond do
      label in [:error, :fatal] -> :ops
      label == :unknown -> cond do
         legacy? -> :dev1
         true -> :dev2 
       end
       true -> false
    end
  end
end
