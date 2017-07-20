defmodule HasManyThrough.Folder do
  use Ecto.Schema

  @primary_key {:folder_uuid, :string, []}
  schema "folders" do
    field :name,              :string

    timestamps()

    many_to_many :parent_folders,
                 HasManyThrough.Folder,
                 join_through: "folder_relations",
                 join_keys: [
                   child_uuid: :folder_uuid, parent_uuid: :folder_uuid
                 ]
    many_to_many :child_folders,
                 HasManyThrough.Folder,
                 join_through: "folder_relations",
                 join_keys: [
                   parent_uuid: :folder_uuid, child_uuid: :folder_uuid
                 ]
  end

  def changeset(model, params \\ :empty) do
    fields = ~w(name)

    model
    |> Ecto.Changeset.cast(params, fields)
    |> Ecto.Changeset.validate_length(:name, max: 42)
    |> Ecto.Changeset.validate_required(:name)
  end
end
