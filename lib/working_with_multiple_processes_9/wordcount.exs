defmodule WorkingWithMultipleProcesses9Scanner do
  # @word "cat"
  @word "fn"
  def scan(scheduler) do
    send scheduler, {:ready, self()}
    receive do
      {:scan, f, client} -> send client, {:answer, f, scan_file(f), self()}
                            scan(scheduler)
      {:shutdown} ->
        exit(:normal)
    end
  end

  defp scan_file(file) do
    File.read!("lib/functions_1/" <> file)
    |> String.split(" ")
    |> Enum.filter(fn (w) -> w == @word end)
    |> Enum.count
  end
end

defmodule WorkingWithMultipleProcesses9Scheduler do
  def run(num_processes, module, func, to_calculate) do
    (1..num_processes)
    |> Enum.map(fn (_) -> spawn(module, func, [self()]) end)
    |> schedule_processes(to_calculate, [])
  end

  defp schedule_processes(processes, queue, results) do
    receive do
      {:ready, pid} when length(queue) > 0 -> [next | tail] = queue
                                              send pid, {:scan, next, self()}
                                              schedule_processes(processes, tail, results)
      {:ready, pid} -> send pid, {:shutdown}
                       if length(processes) > 1 do
                         schedule_processes(List.delete(processes, pid), queue, results)
                       else
                         Enum.sort(results, fn {n1, _}, {n2, _} -> n1 <= n2 end)
                       end
      {:answer, number, result, _pid} -> schedule_processes(processes, queue, [{number, result} | results])
    end
  end
end

files = File.ls!("lib/functions_1")
{time, result} = :timer.tc(
  WorkingWithMultipleProcesses9Scheduler,
  :run,
  [length(files), WorkingWithMultipleProcesses9Scanner, :scan, files]
)
sum = result
      |> Keyword.values()
      |> Enum.sum
IO.puts "result: #{sum} (time: #{time / 1000000.0})"
# result: 3 (time: 0.016)
