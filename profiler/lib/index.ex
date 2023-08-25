defmodule Index do
  use Application

  @impl true
  def start(_type, _args) do
    Profiler.Supervisor.start_link(name: Profiler.Supervisor)
  end
end
