defmodule Profiler.AgeWorker do
  use GenServer

  @me __MODULE__
  def start_link(opts) do
    GenServer.start_link(@me, nil, opts)
  end

  @impl true
  def init(_init_args) do
    Process.send_after(self(), :refresh, 1000)
    {:ok, %{}}
  end

  @impl true
  def handle_call(:profile, _caller, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_info(:refresh, _state) do
    %{body: body} = Profiler.AgeApi.age("pedro")
    new_state = Map.take(body, ["age"])
    GenServer.cast(Profiler.Manager, {:update_and_merge, new_state})

    Process.send_after(self(), :refresh, 20000)
    {:noreply, new_state}
  end

  def handle_info(_, state) do
    {:noreply, state}
  end
end
