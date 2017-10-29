defmodule OTPServers3 do
  use GenServer

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, list}, stack) do
    {:noreply, list ++ stack}
  end
end

# iex(1)> { :ok, pid } = GenServer.start_link(OTPServers3, [5, "cat", 9], name: :stack)
# {:ok, #PID<0.169.0>}
# iex(2)> GenServer.call(:stack, :pop)
# 5
# iex(3)>
