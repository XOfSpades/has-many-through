defmodule HasManyThrough.FolderTest do
  import Ecto.Query

  use ExUnit.Case, async: true
  use HasManyThrough.RepoCase, async: true

  alias HasManyThrough.Support.Fixtures
  alias HasManyThrough.Repo
  alias HasManyThrough.Folder
  alias HasManyThrough.FolderRelation


  setup do
    root_folders = Fixtures.root_folders
    sub_folders = Fixtures.sub_folders
    folders = root_folders ++ sub_folders
    relations = Fixtures.folder_relations

    Enum.each(folders, &Repo.insert!/1)
    Enum.each(relations, &Repo.insert!/1)

    {:ok, root_folders: root_folders, sub_folder: sub_folders, folders: folders}
  end

  test "get all root folders", %{root_folders: root_folders} do
    query = from f in Folder,
          full_join: r in FolderRelation, on: f.folder_uuid == r.child_uuid,
          select: f,
          where: is_nil(r.parent_uuid)

    get_folder_uuids = fn f -> f.folder_uuid end

    db_root_folder_uuids = query |> Repo.all |> Enum.map(get_folder_uuids)

    assert root_folders
    |> Enum.map(get_folder_uuids)
    |> Enum.all?(fn f -> Enum.member?(db_root_folder_uuids, f) end)
  end
end
