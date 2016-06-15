defmodule StringAnalyzer do
  def analyze(string) do
    break_down_text(string) |> process
  end

  def break_down_text(text) do
    String.downcase(text)
      |> String.replace(~r/[^a-z\s]/, "")
      |> String.replace(~r/\s+/, " ")
      |> String.split(~r/ /)
      |> Enum.chunk(3, 1)
  end

  def process(list) do
    Enum.uniq(list)
      |> Enum.sort_by(&Enum.count(list, fn(el) -> el == &1 end))
      |> Enum.reverse
      |> Enum.take(100)
      |> Enum.map(fn(item) -> {item, Enum.count(list, fn(el) -> el == item end)} end)
  end
end
