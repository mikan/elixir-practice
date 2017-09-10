defmodule WorkingWithMultipleProcesses6 do
  def pmap(collection, fun) do
    me = self()
    collection
      |> Enum.map(fn (elem) ->
        spawn_link fn -> (send me, { self(), fun.(elem) }) end
      end)
      |> Enum.map(fn (pid) ->
        receive do { ^pid, result } -> result end
      end)
  end
  def pmap_illegal(collection, fun) do
    collection
      |> Enum.map(fn (elem) ->
        spawn_link fn -> (send self(), { self(), fun.(elem) }) end # 子プロセスから子プロセスに send してしまう
      end)
      |> Enum.map(fn (pid) ->
        receive do { ^pid, result } -> result end # 受け取れない → 永遠に待ち続ける
      end)
  end
end

IO.inspect WorkingWithMultipleProcesses6.pmap 1..10, &(&1 * &1)
# [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
