defmodule OTPServers5 do
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

  def terminate(reason, state) do
    IO.puts("state: #{inspect state}, reason: #{inspect reason}")
  end
end

# pop empty stack...
# state: [], reason: {:function_clause, [{OTPServers5, :handle_call, [:pop, {#PID<0.185.0>, #Reference<0.3752869880.429103
# 5137.75989>}, []], [file: 'lib/otp_servers_5/server.ex', line: 16]}, {:gen_server, :try_handle_call, 4, [file: 'gen_serv
# er.erl', line: 636]}, {:gen_server, :handle_msg, 6, [file: 'gen_server.erl', line: 665]}, {:proc_lib, :init_p_do_apply,
# 3, [file: 'proc_lib.erl', line: 247]}]}
