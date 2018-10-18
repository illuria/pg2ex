defmodule Pg2exTest do
  use ExUnit.Case
  doctest Pg2ex

  test "greets the world" do
    assert Pg2ex.hello() == :world
  end
end
