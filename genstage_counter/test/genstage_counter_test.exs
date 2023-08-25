defmodule GenstageCounterTest do
  use ExUnit.Case
  doctest GenstageCounter

  test "greets the world" do
    assert GenstageCounter.hello() == :world
  end
end
