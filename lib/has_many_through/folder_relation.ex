defmodule HasManyThrough.FolderRelation do
  use Ecto.Schema
  alias HasManyThrough.Folder

  @primary_key false
  schema "folder_relations" do
    belongs_to :parent_folder, Folder, foreign_key: :parent_uuid,
                                       references: :folder_uuid,
                                       type: :string,
                                       primary_key: true
    belongs_to :child_folder, Folder, foreign_key: :child_uuid,
                                      references: :folder_uuid,
                                      type: :string,
                                      primary_key: true

    timestamps()
  end

  def changeset(model, params \\ :empty) do
    fields = ~w(parent_uuid child_uuid)

    model
    |> Ecto.Changeset.cast(params, fields)
    |> Ecto.Changeset.validate_required(:parent_uuid)
    |> Ecto.Changeset.validate_required(:child_uuid)
    |> Ecto.Changeset.validate_length(:parent_uuid, max: 36)
    |> Ecto.Changeset.validate_length(:child_uuid, max: 36)
  end

end
