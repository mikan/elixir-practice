defmodule OTPApplications3.Supervisor do
  use Supervisor

  def start_link(initial_number) do
    result = {:ok, sup} = Supervisor.start_link(__MODULE__, [initial_number])
    start_workers(sup, initial_number)
    result
  end

  def start_workers(sup, initial_number) do
    # スタッシュワーカーを開始
    {:ok, stash} = Supervisor.start_child(sup, worker(OTPApplications3.Stash, [initial_number]))
    # そして、実際の sequence サーバのスーパーバイザを開始
    Supervisor.start_child(sup, supervisor(OTPApplications3.SubSupervisor, [stash]))
  end

  def init(_) do
    supervise [], strategy: :one_for_one
  end
end
