defmodule OTPServers4 do
  use GenServer

  def start_link(stack) do
    GenServer.start_link(__MODULE__, stack, name: __MODULE__)
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def push(item) do
    GenServer.cast __MODULE__, {:push, item}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, item}, stack) do
    {:noreply, [item | stack]}
  end
end

# iex(1)> OTPServers4.start_link([5, "cat", 9])
# {:ok, #PID<0.180.0>}
# iex(2)> OTPServers4.pop
# 5
# iex(3)> OTPServers4.push("push")
# :ok
# iex(4)> OTPServers4.pop
# "push"
# iex(5)> OTPServers4.pop
# "cat"
# iex(6)> OTPServers4.pop
# 9
# iex(7)>
