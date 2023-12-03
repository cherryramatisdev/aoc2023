defmodule Aoc2023 do
  @spec read_challenge(String.t(), integer(), boolean()) :: {:ok, String.t()} | {:err, String.t()}
  def read_challenge(day, part \\ 1, is_prod \\ false) do
    path = if is_prod do
      "lib/#{day}/prod.txt"
    else
      "lib/#{day}/test-#{part}.txt"
    end

    case File.read(path) do
      {:ok, content} -> {:ok, content}
      _ -> {:err, "Error while reading the file"}
    end
  end
end
