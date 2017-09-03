defmodule WorkingWithMultipleProcesses3 do
  import :timer, only: [ sleep: 1 ]

  def sad_function(back) do
    receive do token -> send back, "received #{token}." end
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
      {_, msg} -> IO.puts "MESSAGE RECEIVED: #{inspect msg}"
      receiver()
    after 1500 -> IO.puts "Nothing happend as far as I am concerned"
    end
  end
end

WorkingWithMultipleProcesses3.run

# Nothing happend as far as I am concerned
