defmodule WhatTheBeamTest do
  use ExUnit.Case
  doctest WhatTheBeam

  test "greets the world" do
    assert WhatTheBeam.hello() == :world
  end
end
