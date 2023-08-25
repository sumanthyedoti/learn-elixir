defmodule Profiler.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, nil, opts)
  end

  @impl true
  def init(_init_args) do
    children = [
      {
        Profiler.Manager, [name: Profiler.Manager]
      },
      {
        Profiler.GithubWorker, [name: Profiler.GithubWorker]
      },
      {
        Profiler.AgeWorker, [name: Profiler.AgeWorker]
      }
    ]
    Supervisor.init(children, strategy: :one_for_one)
  end
end
