defmodule GenstageCounter.ProducerConsumer do
  use GenStage
  def start_link(_init) do
    GenStage.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(state) do
    {:producer_consumer, state, subscribe_to: [GenstageCounter.Producer]}
  end

  def handle_events(events, _from_producer, state) do
    numbers = events
              |> Enum.filter(&(div(&1, 2) == 0))
    {:noreply, numbers, state}
  end
end
