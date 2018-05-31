class AddCompletedNoToLearningstyle < ActiveRecord::Migration[5.1]
  def change
    add_column :learningstyles, :completed_no, :integer
  end
end
