Code.load_file("string_analyzer.exs")

defmodule Cli do
  def process(list) do
    Enum.each(list, &printResult(&1))
  end

  defp printResult(file) do
    {_status, text} = File.read(file)
    Enum.each(StringAnalyzer.analyze(text), &printLine(&1))
  end

  defp printLine(tuple) do
    {list, count} = tuple
    IO.puts "#{count} - #{Enum.join(list, " ")}"
  end
end
