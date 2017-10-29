defmodule OTPServers1 do
  use GenServer

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end
end

# iex(1)> { :ok, pid } = GenServer.start_link(OTPServers1, [5, "cat", 9])
# {:ok, #PID<0.186.0>}
# iex(2)> GenServer.call(pid, :pop)
# 5
# iex(3)> GenServer.call(pid, :pop)
# "cat"
# iex(4)> GenServer.call(pid, :pop)
# 9
# iex(5)> GenServer.call(pid, :pop)
# ** (EXIT from #PID<0.179.0>) evaluator process exited with reason: an exception was raised:
#     ** (FunctionClauseError) no function clause matching in OTPServers1.handle_call/3
#         (elixir_practice) lib/otp_servers_1/server.ex:4: OTPServers1.handle_call(:pop, {#PID<0.179.0>, #Reference<0.1024
# 211128.1601961987.244212>}, [])
#         (stdlib) gen_server.erl:636: :gen_server.try_handle_call/4
#         (stdlib) gen_server.erl:665: :gen_server.handle_msg/6
#         (stdlib) proc_lib.erl:247: :proc_lib.init_p_do_apply/3
