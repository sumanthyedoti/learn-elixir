defmodule Auction.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field(:title, :string)
    field(:description, :string)
    field(:ends_at, :utc_datetime)
    timestamps()
  end

  def changeset(item, params \\ %{}) do
    item
    |> cast(params, [:title, :description, :ends_at])
    |> validate_required(:title)
    |> validate_length(:title, min: 3, max: 40)
    |> validate_length(:description, min: 3, max: 200)
    |> validate_change(:ends_at, &validate/2)
  end

  defp validate(:ends_at, ends_at_date) do
    case DateTime.compare(ends_at_date, DateTime.utc_now()) do
      :lt -> [ends_at: "Invalid date. Please provide future datetime"]
      _ -> []
    end
  end
end
