defmodule WorkingWithMultipleProcesses5 do
  import :timer, only: [ sleep: 1 ]

  def sad_function_exit(back) do
    send back, "message sent"
    exit(:boom)
  end
  def sad_function_raise(back) do
    send back, "message sent"
    raise "boom"
  end
  def run_exit do
    Process.flag(:trap_exit, true)
    res = spawn_monitor(__MODULE__, :sad_function_exit, [self()])
    IO.puts inspect res
    sleep 500
    receiver()
  end
  def run_raise do
    Process.flag(:trap_exit, true)
    res = spawn_monitor(__MODULE__, :sad_function_raise, [self()])
    IO.puts inspect res
    sleep 500
    receiver()
  end
  def receiver do
    receive do
      msg -> IO.puts "MESSAGE RECEIVED: #{inspect msg}"
      receiver()
    after 1500 -> IO.puts "Nothing happend as far as I am concerned"
    end
  end
end

IO.puts "----- exit -----"
WorkingWithMultipleProcesses5.run_exit()
IO.puts "----- raise -----"
WorkingWithMultipleProcesses5.run_raise()

# Result:
# ----- exit -----
# {#PID<0.78.0>, #Reference<0.3230801546.2264924164.207160>}
# MESSAGE RECEIVED: "message sent"
# MESSAGE RECEIVED: {:DOWN, #Reference<0.3230801546.2264924164.207160>, :process, #PID<0.78.0>, :boom}
# Nothing happend as far as I am concerned
# ----- raise -----
# {#PID<0.79.0>, #Reference<0.3230801546.2264924164.207187>}
#
# 23:11:43.160 [error] Process #PID<0.79.0> raised an exception
# ** (RuntimeError) boom
#     lib/working_with_multiple_processes_5/monitor.ex:10: WorkingWithMultipleProcesses5.sad_function_raise/1
# MESSAGE RECEIVED: "message sent"
# MESSAGE RECEIVED: {:DOWN, #Reference<0.3230801546.2264924164.207187>, :process, #PID<0.79.0>, {%RuntimeError{message: "b
# oom"}, [{WorkingWithMultipleProcesses5, :sad_function_raise, 1, [file: 'lib/working_with_multiple_processes_5/monitor.ex
# ', line: 10]}]}}
# Nothing happend as far as I am concerned
