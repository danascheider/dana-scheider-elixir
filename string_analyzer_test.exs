Code.load_file("string_analyzer.exs")

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule StringAnalyzerTest do
  use ExUnit.Case

  test "break_down_text groups into threes" do
    input  = "I am the eggman, they are the eggmen"
    output = [["i", "am", "the"], ["am", "the", "eggman"], ["the", "eggman", "they"], ["eggman", "they", "are"], ["they", "are", "the"], ["are", "the", "eggmen"]]

    assert StringAnalyzer.break_down_text(input) == output
  end

  test "process processes the list" do
    input  = ["c", "b", "c", "c", "a", "a"]
    output = [{"c", 3}, {"a", 2}, {"b", 1}]

    assert StringAnalyzer.process(input) == output
  end
end
