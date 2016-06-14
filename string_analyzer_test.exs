Code.load_file("string_analyzer.exs")

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule StringAnalyzerTest do
  use ExUnit.Case

  test "break_down_text creates a list" do
    assert StringAnalyzer.break_down_text("foo bar baz") == [["foo", "bar", "baz"]]
  end

  test "break_down_text downcases everything" do
    assert StringAnalyzer.break_down_text("Foo Bar Baz") == [["foo", "bar", "baz"]]
  end

  test "break_down_text removes punctuation" do
    assert StringAnalyzer.break_down_text("Fo0 b^r ba?") == [[ "fo", "br", "ba" ]]
  end

  test "break_down_text groups into threes" do
    input  = "I am the eggman, they are the eggmen"
    output = [["i", "am", "the"], ["am", "the", "eggman"], ["the", "eggman", "they"], ["eggman", "they", "are"], ["they", "are", "the"], ["are", "the", "eggmen"]]

    assert StringAnalyzer.break_down_text(input) == output
  end

  test "sort_by_frequency sorts by frequency" do
    input  = ["c", "b", "c", "c", "a", "a"]
    output = [{"c", 3}, {"a", 2}, {"b", 1}]

    assert StringAnalyzer.sort_by_frequency(input) == output
  end
end
