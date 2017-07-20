defmodule HasManyThrough.Folder do
  use Ecto.Schema

  @primary_key {:folder_uuid, :string, []}
  schema "folders" do
    field :name,              :string

    timestamps()
  end

  def changeset(model, params \\ :empty) do
    fields = ~w(name)

    model
    |> Ecto.Changeset.cast(params, fields)
    |> Ecto.Changeset.validate_length(:name, max: 42)
    |> Ecto.Changeset.validate_required(:name)
  end
end
