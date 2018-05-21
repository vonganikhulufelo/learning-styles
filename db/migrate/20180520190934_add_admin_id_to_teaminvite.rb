class AddAdminIdToTeaminvite < ActiveRecord::Migration[5.1]
  def change
    add_column :teaminvites, :admin_id, :bigint
  end
end
