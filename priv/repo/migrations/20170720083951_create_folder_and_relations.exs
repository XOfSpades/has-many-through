defmodule HasManyThrough.Repo.Migrations.CreateFolderAndRelations do
  use Ecto.Migration

  def change do
    create table(:folders, primary_key: false) do
      add :name,          :string
      add :folder_uuid,   :string, size: 36, primary_key: true
      timestamps()
    end

    create table(:folder_relations, primary_key: false) do
      add :parent_uuid, references(:folders, column: :folder_uuid, type: :string, size: 36)
      add :child_uuid,  references(:folders, column: :folder_uuid, type: :string, size: 36)
      timestamps()
    end
  end
end
