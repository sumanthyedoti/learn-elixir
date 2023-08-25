defmodule FirstWebServerTest do
  use ExUnit.Case
  doctest FirstWebServer

  test "greets the world" do
    assert FirstWebServer.hello() == :world
  end
end
