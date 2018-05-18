class AddStepNoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :step_no, :integer
  end
end
