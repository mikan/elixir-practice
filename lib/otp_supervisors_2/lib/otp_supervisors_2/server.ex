defmodule OTPSupervisors2.Server do
  use GenServer

  def start_link(stash_pid) do
    GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def push(item) do
    GenServer.cast __MODULE__, {:push, item}
  end

  def handle_call(:pop, _from, {[head | tail], stash_pid}) do
    {:reply, head, {tail, stash_pid}}
  end

  def handle_cast({:push, item}, {stack, stash_pid}) do
    {:noreply, {[item | stack], stash_pid}}
  end

  def init(stash_pid) do
    stack = OTPSupervisors2.Stash.get_value stash_pid
    {:ok, {stack, stash_pid}}
  end

  def terminate(_reason, {stack, stash_pid}) do
    OTPSupervisors2.Stash.save_value stash_pid, stack
  end
end
