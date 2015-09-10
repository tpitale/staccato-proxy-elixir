defmodule Staccato.Proxy do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    port = 9090

    children = [
      supervisor(Task.Supervisor, [[name: Staccato.Proxy.Listener.TaskSupervisor]]),
      worker(Task, [Staccato.Proxy.Listener, :accept, [port]])
    ]

    opts = [strategy: :one_for_one, name: Staccato.Proxy.Listener.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
