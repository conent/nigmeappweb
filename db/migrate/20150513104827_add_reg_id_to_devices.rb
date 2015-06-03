class AddRegIdToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :regID, :string
  end
end
