defmodule OTPSupervisors2.Supervisor do
  use Supervisor

  def start_link(initial_list) do
    result = {:ok, sup} = Supervisor.start_link(__MODULE__, [initial_list])
    start_workers(sup, initial_list)
    result
  end

  def start_workers(sup, initial_list) do
    # スタッシュワーカーを開始
    {:ok, stash} = Supervisor.start_child(sup, worker(OTPSupervisors2.Stash, [initial_list]))
    # そして、実際のサーバーのスーパーバイザを開始
    Supervisor.start_child(sup, supervisor(OTPSupervisors2.SubSupervisor, [stash]))
  end

  def init(_) do
    supervise [], strategy: :one_for_one
  end
end
