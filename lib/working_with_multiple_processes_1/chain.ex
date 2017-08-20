defmodule Chain do
  def counter(next_pid) do
    receive do n -> send next_pid, n + 1 end
  end
  def create_processes(n) do
    last = Enum.reduce 1..n, self(), fn (_, send_to) -> spawn(Chain, :counter, [send_to]) end
    send last, 0 # 0 を最後に作ったプロセスへ送り、カウントを開始
    receive do final_answer when is_integer(final_answer) -> "Result is #{inspect(final_answer)}" end
  end
  def run(n) do
    IO.puts inspect :timer.tc(Chain, :create_processes, [n])
  end
end

# Windows 10 Pro x64 / Elixir 1.5.0 / Intel Xeon X3320 (≒ Core 2 Quad Q9300)
# {0, "Result is 10"}
# {0, "Result is 100"}
# {16000, "Result is 1000"}
# {94000, "Result is 10000"}
# {375000, "Result is 40000"}
# {891000, "Result is 100000"}
