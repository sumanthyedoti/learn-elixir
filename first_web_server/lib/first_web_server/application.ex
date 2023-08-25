defmodule FirstWebServer.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: FirstWebServer.WebServer, options: [port: 4000]},
      {Plug.Cowboy, scheme: :http, plug: FirstWebServer.WebServer2, options: [port: 4001]}
    ]
    opts = [strategy: :one_for_one, name: FirstWebServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
