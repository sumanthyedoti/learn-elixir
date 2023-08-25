defmodule Profiler.Manager do
  use GenServer

  @me __MODULE__

  def start_link(opts \\ []) do
    GenServer.start_link(@me, nil, Keyword.merge(opts, name: @me))
  end

  def profile do
    GenServer.call(@me, :profile)
  end

  @impl true
  def init(_init_args) do
    {:ok, %{}}
  end

  @impl true
  def handle_call(:profile, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:update_and_merge, data}, state) do
    new_state = Map.merge(state, data)
    {:noreply, new_state}
  end

  @impl true
  def handle_info(_, state) do
    {:noreply, state}
  end
end
