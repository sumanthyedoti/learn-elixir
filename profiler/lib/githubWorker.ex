defmodule Profiler.GithubWorker do
  use GenServer

  @me __MODULE__
  def start_link(opts) do
    GenServer.start_link(@me, nil, opts)
  end

  @impl true
  def init(_init_args) do
    Process.send_after(self, :refresh, 1000)
    {:ok, %{}}
  end

  @impl true
  def handle_call(:profile, _caller, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_info(:refresh, _state) do
    HTTPoison.start()
    %{body: body} = HTTPoison.get!("https://api.github.com/users/sumanthyedoti")
    response = Jason.decode!(body)
    new_state = Map.take(response, ["name", "blog", "avatar_url"])
    GenServer.cast(Profiler.Manager, {:update_and_merge, new_state})

    Process.send_after(self(), :refresh, :timer.seconds(64))
    {:noreply, new_state}
  end

  def handle_info(_, state) do
    {:noreply, state}
  end
end
