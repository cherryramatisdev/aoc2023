defmodule Aoc2023 do
  @spec read_challenge(String.t()) :: {:ok, String.t()} | {:err, String.t()}
  def read_challenge(day) do
    case File.read("lib/#{day}/input.txt") do
      {:ok, content} -> {:ok, content}
      _ -> {:err, "Error while reading the file"}
    end
  end
end
