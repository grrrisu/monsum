defmodule MonsumTest do
  use ExUnit.Case
  doctest Monsum

  test "greets the world" do
    assert Monsum.hello() == :world
  end
end
