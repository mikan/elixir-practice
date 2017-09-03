defmodule WorkingWithMultipleProcesses3 do
  import :timer, only: [ sleep: 1 ]

  def sad_function(back) do
    send back, "message sent"
    exit(:boom)
  end
  def run do
    Process.flag(:trap_exit, true)
    spawn_link(WorkingWithMultipleProcesses3, :sad_function, [self()])
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

WorkingWithMultipleProcesses3.run()

# Result:
# MESSAGE RECEIVED: "message sent"
# MESSAGE RECEIVED: {:EXIT, #PID<0.78.0>, :boom}
# Nothing happend as far as I am concerned
