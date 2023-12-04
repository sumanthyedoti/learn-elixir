defmodule Auction do
  alias Auction.{FakeRepo, Item}

  @repo FakeRepo

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
end

