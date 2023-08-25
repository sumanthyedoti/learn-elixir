defmodule Chat.Server do
  use GenServer

  # client API
  def start_link(init_args) do
    GenServer.start_link(__MODULE__, init_args, name: :chat_server)
  end
  def get_messages do
    GenServer.call(:chat_server, :get_messages)
  end
  def send_message(message) do
    GenServer.cast(:chat_server, {:send_message, message})
  end

  # server / callback functions
  def init(messages) do
    {:ok, messages}
  end
  def handle_call(:get_messages, _from, messages) do
    {:reply, messages, messages}
  end
  def handle_cast({:send_message, new_message}, messages) do
    {:noreply, [new_message | messages]}
  end
end
