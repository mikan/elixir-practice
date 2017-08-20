defmodule WorkingWithMultipleProcesses2 do
  def echo(back) do
    receive do token -> send back, "received #{token}." end
  end
  def create_processes() do
    fred = spawn(WorkingWithMultipleProcesses2, :echo, [self()])
    betty = spawn(WorkingWithMultipleProcesses2, :echo, [self()])
    send fred, "fred"
    send betty, "betty"
    receive do token -> IO.puts token end
    receive do token -> IO.puts token end
  end
end

WorkingWithMultipleProcesses2.create_processes()
