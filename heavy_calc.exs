calc =
  fn num ->
    1000
    |> :rand.uniform()
    |> :timer.sleep()

    num * 2
  end

async_calc =
  fn num ->
    parent = self()
    ref = make_ref()

    spawn fn ->
      send(parent, {ref, calc.(num)})
    end

    ref
  end

collect =
  fn ref ->
    receive do
      {^ref, msg} -> msg
    end
  end

[6, 5, 4, 3, 6, 2, 1, 8]
|> Enum.map(async_calc)
|> Enum.map(collect)
|> IO.inspect(label: "CALC RESULT")
