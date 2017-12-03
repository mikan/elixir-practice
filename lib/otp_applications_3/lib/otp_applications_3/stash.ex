defmodule OTPApplications3.Stash do
  use GenServer
  require Logger

  @vsn "1"

  #####
  # 外部 API

  def start_link(n_and_delta) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, n_and_delta)
  end

  def save_value(pid, value) do
    GenServer.cast pid, {:save_value, value}
  end

  def get_value(pid) do
    GenServer.call pid, :get_value
  end

  #####
  # GenServer の実装

  def handle_call(:get_value, _from, current_value) do
    {:reply, current_value, current_value}
  end

  def handle_cast({:save_value, value}, _current_value) do
    {:noreply, value}
  end

  def code_change("0", old_state = {current_number, _stash_pid}, _extra) do
    new_state = %{:n => current_number, :delta => 1}
    Logger.info "Changing code from 0 to 1"
    Logger.info inspect(old_state)
    Logger.info inspect(new_state)
    {:ok, new_state}
  end
end
