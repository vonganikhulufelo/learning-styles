class AddNameToTeaminvite < ActiveRecord::Migration[5.1]
  def change
    add_column :teaminvites, :name, :string
  end
end
