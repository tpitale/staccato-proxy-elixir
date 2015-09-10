defmodule Staccato.Proxy.Sender do
  # make HTTPotion.post to GA with body

  def deliver(data) do
    # HTTPotion.post
    IO.puts "Sending data: #{inspect data}"

    response = HTTPotion.post("http://www.google-analytics.com/collect", [body: data])
    IO.puts "Got response: #{inspect response}"
  end
end
