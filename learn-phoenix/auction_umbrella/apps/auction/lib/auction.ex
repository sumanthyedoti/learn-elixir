defmodule Auction do
  alias Auction.{Item}

  @repo Auction.Repo

  def insert_item(attrs) do
    current_datetime = DateTime.utc_now() |> DateTime.truncate(:second)

    Auction.Item
    |> struct(attrs |> Map.put_new(:ends_at, current_datetime))
    |> @repo.insert()
  end

  def list_items() do
    @repo.all(Item)
    # When you pass Item in as the first argument, it lets the repo know which
    # database table (set of data) you’re requesting (with pattern matching)
  end

  def get_item(id) do
    @repo.get!(Item, id)
  end

  def get_item_by(attrs) do
    @repo.get_by(Item, attrs)
  end

  def delete_item(%Auction.Item{} = item), do: @repo.delete(item)

  def update_item(%Auction.Item{} = item, updates) do
    Item.changeset(item, updates)
    |> @repo.update()
  end
end
