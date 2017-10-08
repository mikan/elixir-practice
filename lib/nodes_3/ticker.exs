defmodule Nodes3Ticker do

  @interval 2000 # 2 seconds
  @name :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[], -1])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), {:register, client_pid}
  end

  def generator(clients, last) do
    receive do
      {:register, pid} ->
        IO.puts "registering #{inspect pid}"
        generator([pid | clients], last)
    after
      @interval ->
        IO.puts "tick"
        cond do
          Enum.count(clients) == 0 ->
            generator(clients, -1)
          Enum.count(clients) > last ->
            send Enum.at(clients, last), {:tick}
            generator(clients, last + 1)
          true ->
            send Enum.at(clients, 0), {:tick}
            generator(clients, 1)
        end
    end
  end
end

defmodule Nodes3Client do

  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Nodes3Ticker.register(pid)
  end

  def receiver do
    receive do
      {:tick} ->
        IO.puts "tock in client"
        receiver()
    end
  end
end
