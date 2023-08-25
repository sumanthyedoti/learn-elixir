defmodule GenstageCounter.Consumer do
  use GenStage


  def start_link(_init) do
    GenStage.start_link(__MODULE__, :the_state_does_not_matter)
  end

  def init(state) do
    {:consumer, state, subscribe_to: [GenstageCounter.ProducerConsumer]}
  end

  def handle_events(events, _from, state) do
    for event <- events do
      IO.inspect {self(), event}
    end
    {:noreply, [], state}

  end
end
