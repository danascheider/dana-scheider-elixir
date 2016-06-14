defmodule StringAnalyzer do
  def break_down_text(text) do
    String.downcase(text)
      |> String.replace(~r/[^a-z\s]/, "")
      |> String.replace(~r/\s+/, " ")
      |> String.split(~r/ /)
      |> Enum.chunk(3, 1)
  end
end
