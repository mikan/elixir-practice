defmodule OTPServers2 do
  use GenServer

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, list}, stack) do
    {:noreply, list ++ stack}
  end
end

# iex(1)> { :ok, pid } = GenServer.start_link(OTPServers2, [5, "cat", 9])
# {:ok, #PID<0.180.0>}
# iex(2)> GenServer.call(pid, :pop)
# 5
# iex(3)> GenServer.cast(pid, {:push, [1,2,3]})
# :ok
# iex(4)> GenServer.call(pid, :pop)
# 1
# iex(5)> GenServer.call(pid, :pop)
# 2
# iex(6)> GenServer.call(pid, :pop)
# 3
# iex(7)> GenServer.call(pid, :pop)
# "cat"
# iex(8)>
