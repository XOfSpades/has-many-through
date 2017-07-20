defmodule HasManyThrough.FolderRelation do
  use Ecto.Schema
  alias HasManyThrough.Folder

  @primary_key false
  schema "folders" do
    belongs_to :parent_folder, Folder, foreign_key: :parent_uuid, references: :folder_uuid
    belongs_to :child_folder, Folder, foreign_key: :child_uuid, references: :folder_uuid

    timestamps()
  end

  def changeset(model, params \\ :empty) do
    fields = ~w(parent_uuid child_uuid)

    model
    |> Ecto.Changeset.cast(params, fields)
    |> Ecto.Changeset.validate_required(:parent_uuid)
    |> Ecto.Changeset.validate_required(:child_uuid)
  end

end
