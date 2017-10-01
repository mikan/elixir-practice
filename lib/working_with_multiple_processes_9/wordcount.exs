defmodule WorkingWithMultipleProcesses9Scanner do
  def scan(scheduler) do
    send scheduler, {:ready, self()}
    receive do
      {:scan, f, word, client} ->
        send client, {:answer, f, scan_file(f, word), self()}
        scan(scheduler)
      {:shutdown} ->
        exit(:normal)
    end
  end

  defp scan_file(f, word) do
    File.read!(f)
    |> String.split(" ")
    |> Enum.filter(&(&1 == word))
    |> Enum.count
  end
end

defmodule WorkingWithMultipleProcesses9Scheduler do
  def run(num_processes, module, func, to_calculate, word) do
    (1..num_processes)
    |> Enum.map(fn (_) -> spawn(module, func, [self()]) end)
    |> schedule_processes(to_calculate, [], word)
  end

  defp schedule_processes(processes, queue, results, word) do
    receive do
      {:ready, pid} when length(queue) > 0 ->
        [next | tail] = queue
        send pid, {:scan, next, word, self()}
        schedule_processes(processes, tail, results, word)
      {:ready, pid} ->
        send pid, {:shutdown}
        if length(processes) > 1 do
          schedule_processes(List.delete(processes, pid), queue, results, word)
        else
          Enum.sort(results, fn {n1, _}, {n2, _} -> n1 <= n2 end)
        end
      {:answer, number, result, _pid} ->
        schedule_processes(processes, queue, [{number, result} | results], word)
    end
  end
end

word = "a"
files = File.ls!(".")
        |> Enum.filter(&(!File.dir?(&1)))
{time, result} = :timer.tc(
  WorkingWithMultipleProcesses9Scheduler,
  :run,
  [length(files), WorkingWithMultipleProcesses9Scanner, :scan, files, word]
)
IO.inspect Keyword.keys(result)
IO.puts ">>> number of \"#{word}\": #{Enum.sum(Keyword.values(result))} (time: #{time / 1000000.0})"

# Result:
# [".gitignore", ".travis.yml", "LICENSE", "README.md", "aosn-up.sh",
# "elixirpractice.iml", "mix.exs", "mix.lock"]
# >>> number of "a": 17 (time: 0.0)
