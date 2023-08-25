defmodule SupSample.Application do
  @moduledoc false
  use Application
  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: SupSample.Worker.start_link(arg)
      # {SupSample.Worker, arg},
      {MyServer, []},
    ]
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: :SupSample_Supervisor]
    Supervisor.start_link(children, opts)
  end
end
