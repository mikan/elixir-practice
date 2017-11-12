defmodule OtpSupervisors1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: OtpSupervisors1.Worker.start_link(arg)
      # {OtpSupervisors1.Worker, arg},
      worker(OTPSupervisors1.Server, [[5, "cat", 9]])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OtpSupervisors1.Supervisor]
    {:ok, _pid} = Supervisor.start_link(children, opts)
  end
end

# iex(1)> OTPSupervisors1.Server.pop
# 5
# iex(2)> OTPSupervisors1.Server.pop
# "cat"
# iex(3)> OTPSupervisors1.Server.pop
# 9
# iex(4)> OTPSupervisors1.Server.pop
# ** (exit) exited in: GenServer.call(OTPSupervisors1.Server, :pop, 5000)
#     ** (EXIT) an exception was raised:
#         ** (FunctionClauseError) no function clause matching in OTPSupervisors1.Server.handle_call/3
#             (otp_supervisors_1) lib/otp_supervisors_1/server.ex:16: OTPSupervisors1.Server.handle_call(:pop, {#PID<0.153.0>, #Reference<0.807314730.1505230852.114703>}, [])
#             (stdlib) gen_server.erl:636: :gen_server.try_handle_call/4
#             (stdlib) gen_server.erl:665: :gen_server.handle_msg/6
#             (stdlib) proc_lib.erl:247: :proc_lib.init_p_do_apply/3
#     (elixir) lib/gen_server.ex:774: GenServer.call/3
# iex(4)>
# 22:26:05.196 [error] GenServer OTPSupervisors1.Server terminating
# ** (FunctionClauseError) no function clause matching in OTPSupervisors1.Server.handle_call/3
#     (otp_supervisors_1) lib/otp_supervisors_1/server.ex:16: OTPSupervisors1.Server.handle_call(:pop, {#PID<0.153.0>, #Reference<0.807314730.1505230852.114703>}, [])
#     (stdlib) gen_server.erl:636: :gen_server.try_handle_call/4
#     (stdlib) gen_server.erl:665: :gen_server.handle_msg/6
#     (stdlib) proc_lib.erl:247: :proc_lib.init_p_do_apply/3
# Last message (from #PID<0.153.0>): :pop
# State: []
# Client #PID<0.153.0> is alive
#     (stdlib) gen.erl:169: :gen.do_call/4
#     (elixir) lib/gen_server.ex:771: GenServer.call/3
#     (stdlib) erl_eval.erl:670: :erl_eval.do_apply/6
#     (elixir) src/elixir.erl:237: :elixir.eval_forms/4
#     (iex) lib/iex/evaluator.ex:219: IEx.Evaluator.handle_eval/5
#     (iex) lib/iex/evaluator.ex:200: IEx.Evaluator.do_eval/3
#     (iex) lib/iex/evaluator.ex:178: IEx.Evaluator.eval/3
#     (iex) lib/iex/evaluator.ex:77: IEx.Evaluator.loop/1
#
# iex(4)> OTPSupervisors1.Server.pop
# 5
# iex(5)> OTPSupervisors1.Server.pop
# "cat"
# iex(6)>
