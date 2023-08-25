defmodule HelloWorld do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, "Joe")
  end

  def init(state) do
    Process.send_after(self(), :hello, 1000)
    {:ok, state}
  end

  def handle_info(:hello, name) do
    IO.puts("Hello, #{name}")
    Process.send_after(self(), :hello, 1000)
    {:noreply, name}
  end
end
