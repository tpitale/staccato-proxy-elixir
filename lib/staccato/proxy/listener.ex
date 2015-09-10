defmodule Staccato.Proxy.Listener do
  # Start UDP socket and then call Sender whenever we recv
  # server = Socket.UDP.open!(port)
  # loop around: { data, client } = server |> Socket.Datagram.recv!
  # send the data in a new task

  def accept(port) do
    server = Socket.UDP.open!(port)

    IO.puts "Running Listener server on #{port}"

    loop(server)
  end

  defp loop(server) do
    server |> Socket.Datagram.recv! |> deliver

    loop(server)
  end

  defp deliver({data, client}) do
    IO.puts "Received data: #{inspect data} from #{inspect client}"

    {:ok, pid} = Task.Supervisor.start_child(Staccato.Proxy.Listener.TaskSupervisor, fn -> Staccato.Proxy.Sender.deliver(data) end)

    # :ok = Socket.UDP.process(client, pid)
  end
end
