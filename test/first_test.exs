defmodule Aoc2023.FirstTest do
  use ExUnit.Case

  test "part1" do
    input = """
    1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet
    """

    assert Aoc2023.First.part1(input) == 142
  end

  test "part2" do
    input = """
    two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen
    """

    assert Aoc2023.First.part2(input) == 281
  end
end
