defmodule Anagram do
  @moduledoc """
  Checks is given two text samples are anagrams or not
  """

  @doc """
  ## Examples

      iex> Anagram.anagram?("car", "arc")
      true
  """
  def anagram?(a, b) do
    charlist(a) == charlist(b)
  end

  defp charlist(text) do
    text
    |> String.trim()
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end
end
