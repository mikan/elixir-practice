defmodule OTPServer1 do
  use GenServer

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end
end

# iex(1)> c("lib/otp_servers_1/server.ex")
# [OTPServer1]
# iex(2)> { :ok, pid } = GenServer.start_link(OTPServer1, [5, "cat", 9])
# {:ok, #PID<0.175.0>}
#  iex(3)> GenServer.call(pid, :pop)
# 5
# iex(4)> GenServer.call(pid, :pop)
# "cat"
# iex(5)> GenServer.call(pid, :pop)
# 9
# iex(6)>
