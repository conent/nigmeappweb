class RemoveOwnerFromDevices < ActiveRecord::Migration
  def change
    remove_column :devices, :owner, :string
  end
end
