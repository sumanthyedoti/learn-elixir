defmodule ShoppingList do
  use GenServer

  # Client
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [])
  end
  def add(pid, item) do
    GenServer.cast(pid, {:add, item})
  end
  def view(pid) do
    GenServer.call(pid, :view)
  end
  def remove(pid, item) do
    GenServer.cast(pid, {:remove, item})
  end
  def stop(pid) do
    GenServer.stop(pid, :noraml, :infinity)
  end

  # Server
  def init(list) do
    {:ok, list}
  end
  def handle_cast({:add, item}, list) do
    if is_list(item) do
      throw "Add one by one seperatly"
    end
    updated_list = [item | list]
    {:noreply, updated_list}
  end
  def handle_call(:view, _from, list) do
    {:reply, list, list}
  end
  def handle_cast({:remove, item}, list) do
    updated_list = Enum.reject(list, fn(x) -> x == item end)
    {:noreply, updated_list}
  end
  def terminate(_reason, list) do
    IO.puts "We are all done shopping"
    IO.inspect(list)
    :ok
  end
end
