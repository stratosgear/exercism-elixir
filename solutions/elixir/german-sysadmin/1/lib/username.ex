defmodule Username do
  def sanitize(username) do
    username
    |> Enum.flat_map(fn char ->
      case transform_char(char) do
        nil -> []
        single_char when is_integer(single_char) -> [single_char]
        char_list when is_list(char_list) -> char_list
      end
    end)
  end

  defp transform_char(char) do
    case char do
      "" ->
        nil

      ?ä ->
        [?a, ?e]

      ?ö ->
        [?o, ?e]

      ?ü ->
        [?u, ?e]

      ?ß ->
        [?s, ?s]

      ?_ ->
        char

      _ ->
        if char < ?a || char > ?z do
          nil
        else
          char
        end
    end
  end
end
