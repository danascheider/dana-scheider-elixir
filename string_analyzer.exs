defmodule StringAnalyzer do
  def break_down_text(text) do
    String.downcase(text)
      |> String.replace(~r/[^a-z\s]/, "")
      |> String.replace(~r/\s+/, " ")
      |> String.split(~r/ /)
      |> Enum.chunk(3, 1)
  end

  def sort_by_frequency(list) do
    Enum.sort(list, &compare_count(list, &1, &2))
      |> Enum.chunk_by(&(&1))
      |> #
  end

  defp compare_count(list, a, b) do
    Enum.count(list, fn(el) -> el == a end) >= Enum.count(list, fn(el) -> el == b end)
  end
end
