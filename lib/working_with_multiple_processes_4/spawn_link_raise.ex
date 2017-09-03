defmodule WorkingWithMultipleProcesses4 do
  import :timer, only: [ sleep: 1 ]

  def sad_function(back) do
    send back, "message sent"
    raise "boom"
  end
  def run do
    Process.flag(:trap_exit, true)
    spawn_link(__MODULE__, :sad_function, [self()])
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

WorkingWithMultipleProcesses4.run()

# Result:
# 22:58:38.185 [error] Process #PID<0.78.0> raised an exception
#  ** (RuntimeError) boom
#      lib/working_with_multiple_processes_4/spawn_link_raise.ex:6: WorkingWithMultipleProcesses4.sad_function/1
#  MESSAGE RECEIVED: "message sent"
#  MESSAGE RECEIVED: {:EXIT, #PID<0.78.0>, {%RuntimeError{message: "boom"}, [{WorkingWithMultipleProcesses4, :sad_function,
#   1, [file: 'lib/working_with_multiple_processes_4/spawn_link_raise.ex', line: 6]}]}}
#  Nothing happend as far as I am concerned
