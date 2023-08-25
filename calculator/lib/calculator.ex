defmodule Calculator do
  @moduledoc """
  Calculator with spawned function
  """

  @doc """
  Starts the caluclator.
  Spawns the loop function which does the operations and maitains current sum
  """
  def start do
    spawn(fn -> loop(0) end)
  end

  defp loop(current_value) do
    new_value = receive do
      {:value, client_id} ->
        send(client_id, {:response, current_value})
        current_value
      {:add, value} -> current_value + value
      {:sub, value} -> current_value - value
      {:mul, value} -> current_value * value
      {:div, value} -> Kernel.div(current_value, value)
      _ -> throw "Invalid Request"
    end
    loop(new_value)
  end

  @doc """
  returns cuurent value to user
  """
  def value(server_id) do
    send(server_id, {:value, self()})
    receive do
      {:response, value} -> value
    end
  end

  @doc """
  returns the result after adding `value` to current sum
  """
  def add(server_id, value) do
    send(server_id, {:add, value})
    value(server_id)
  end

  @doc """
  returns the result after subtracting `value` to current sum
  """
  def sub(server_id, value) do
    send(server_id, {:sub, value})
    value(server_id)
  end

  @doc """
  returns the result after multiplying `value` to current sum
  """
  def mul(server_id, value) do
    send(server_id, {:mul, value})
    value(server_id)
  end

  @doc """
  returns the result after diving(integer division) `value` to current sum
  """
  def div(server_id, value) do
    send(server_id, {:div, value})
    value(server_id)
  end
end
