defmodule HasManyThrough.Support.Fixtures do
  alias HasManyThrough.Folder
  alias HasManyThrough.FolderRelation

  @root_folders [
    %Folder{name: "root1", folder_uuid: UUID.uuid4(:hex)},
    %Folder{name: "root2", folder_uuid: UUID.uuid4(:hex)}
  ]
  @sub_folders [
    %Folder{name: "sub_to_1_2", folder_uuid: UUID.uuid4(:hex)},
    %Folder{name: "sub_to_1", folder_uuid: UUID.uuid4(:hex)},
    %Folder{name: "sub_to_2", folder_uuid: UUID.uuid4(:hex)},
    %Folder{name: "sub_to_none", folder_uuid: UUID.uuid4(:hex)}
  ]

  def folder_relations do
    [root1, root2] = @root_folders
    [sub1, sub2, sub3, _sub4] = @sub_folders

    [
      %FolderRelation{
        parent_uuid: root1.folder_uuid, child_uuid: sub1.folder_uuid
      },
      %FolderRelation{
        parent_uuid: root2.folder_uuid, child_uuid: sub1.folder_uuid
      },
      %FolderRelation{
        parent_uuid: root1.folder_uuid, child_uuid: sub2.folder_uuid
      },
      %FolderRelation{
        parent_uuid: root2.folder_uuid, child_uuid: sub3.folder_uuid
      }
    ]
  end

  def root_folders, do: @root_folders

  def sub_folders, do: @sub_folders
end
