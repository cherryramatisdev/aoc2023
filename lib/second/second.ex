defmodule Aoc2023.Second do
  @spec part1(String.t()) :: integer()
  def part1(challenge) do
    String.split(challenge, "\n", trim: true)
    |> Enum.map(fn x ->
      possible_games =
        String.split(x, ";")
        |> Enum.map(&Aoc2023.Second.get_cubes/1)
        |> Enum.map(fn %{green: green, red: red, blue: blue} ->
          green <= 13 && blue <= 14 && red <= 12
        end)

      cond do
        Enum.member?(possible_games, false) ->
          0

        true ->
          Regex.run(~r/Game\s(\d+)/, x, capture: :all_but_first) |> hd |> String.to_integer()
      end
    end)
    |> Enum.reduce(&(&1 + &2))
  end

  @spec part2(String.t()) :: integer()
  def part2(challenge) do
    String.split(challenge, "\n", trim: true)
    |> Enum.map(fn x ->
      %{green: green, red: red, blue: blue} =
        String.split(x, ";")
        |> Enum.map(&Aoc2023.Second.get_cubes/1)
        |> Enum.reduce(fn %{green: green, red: red, blue: blue},
                          %{green: acc_green, red: acc_red, blue: acc_blue} ->
          %{green: max(green, acc_green), blue: max(blue, acc_blue), red: max(red, acc_red)}
        end)

      green * red * blue
    end)
    |> Enum.reduce(&(&1 + &2))
  end

  @spec get_challenge(integer(), boolean()) :: String.t()
  def get_challenge(part, is_prod \\ false) do
    {:ok, challenge} = Aoc2023.read_challenge("second", part, is_prod)

    challenge
  end

  @spec get_cubes(String.t()) :: %{blue: integer(), green: integer(), red: integer()}
  def get_cubes(input) do
    blue = get_cube(color: "blue", input: input)
    green = get_cube(color: "green", input: input)
    red = get_cube(color: "red", input: input)

    %{
      blue: blue,
      green: green,
      red: red
    }
  end

  @spec get_cube(color: String.t(), input: String.t()) :: integer()
  defp get_cube(color: color, input: input) do
    number_of_cubes = Regex.run(~r/(\d+)\s#{color}/, input, capture: :all_but_first)

    case number_of_cubes do
      s when is_binary(hd(s)) -> String.to_integer(hd(number_of_cubes))
      _ -> 0
    end
  end
end
