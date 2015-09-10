defmodule Staccato.Proxy.CLI do
  def main(args) do
    args |> parse_args |> process
  end

  def process([]) do
    IO.puts "No arguments given"
  end

  def process(options) do
    IO.puts "Starting Listener with: #{inspect options}"

    Staccato.Proxy.start(options)
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [port: :integer, ssl: :boolean]
    )
    options
  end
end
