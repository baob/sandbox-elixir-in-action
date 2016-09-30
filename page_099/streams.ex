defmodule Streams do
  defp file_stream!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
  end

  def large_lines!(path) do
    file_stream!(path)
    |> Enum.filter(&(String.length(&1) > 80))
  end

  def lines_lengths!(path) do
    file_stream!(path)
    |> Enum.map(&String.length(&1))
  end

  def longest_line_length!(path) do
    file_stream!(path)
    |> Enum.reduce(0, &max(String.length(&1), &2))
  end

  def longest_line!(path) do
    file_stream!(path)
    |> Stream.map(&{String.length(&1), &1})
    |> Enum.reduce({0, ''}, &max(&1, &2))
  end

  def words_per_line!(path) do
    file_stream!(path)
    |> Enum.map(&length(String.split(&1)))
  end
end
