defmodule OTPServers2 do
  use GenServer

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, item}, stack) do
    {:noreply, [item | stack]}
  end
end

# iex(1)> { :ok, pid } = GenServer.start_link(OTPServers2, [5, "cat", 9])
# {:ok, #PID<0.180.0>}
# iex(2)> GenServer.call(pid, :pop)
# 5
# iex(3)> GenServer.cast(pid, {:push, "push"})
# :ok
# iex(4)> GenServer.call(pid, :pop)
# "push"
# iex(5)> GenServer.call(pid, :pop)
# "cat"
# iex(6)> GenServer.call(pid, :pop)
# 9
# iex(7)>
