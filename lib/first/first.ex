defmodule Aoc2023.First do
  @spec part1(String.t()) :: integer()
  def part1(challenge) do
    String.split(challenge, "\n", trim: true)
    |> Enum.map(fn x -> String.graphemes(x) |> Enum.filter(&Aoc2023.First.is_numeric?/1) end)
    |> Enum.map(fn x -> String.to_integer("#{List.first(x)}#{List.last(x)}") end)
    |> Enum.reduce(&(&1 + &2))
  end

  @spec part2(String.t()) :: integer()
  def part2(challenge) do
    String.split(challenge, "\n", trim: true)
    |> Enum.map(fn x ->
      x
      |> String.replace("one", "one1one")
      |> String.replace("two", "two2two")
      |> String.replace("three", "three3three")
      |> String.replace("four", "four4four")
      |> String.replace("five", "five5five")
      |> String.replace("six", "six6six")
      |> String.replace("seven", "seven7seven")
      |> String.replace("eight", "eight8eight")
      |> String.replace("nine", "nine9nine")
    end)
    |> Enum.map(fn x -> String.graphemes(x) |> Enum.filter(&Aoc2023.First.is_numeric?/1) end)
    |> Enum.map(fn x -> String.to_integer("#{List.first(x)}#{List.last(x)}") end)
    |> Enum.reduce(&(&1 + &2))
  end

  def is_numeric?(str) do
    Regex.match?(~r/^\d+$/, str)
  end

  @spec get_challenge(integer(), boolean()) :: String.t()
  def get_challenge(part, is_prod \\ false) do
    {:ok, challenge} = Aoc2023.read_challenge("first", part, is_prod)

    challenge
  end
end
