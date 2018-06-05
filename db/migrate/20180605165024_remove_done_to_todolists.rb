class RemoveDoneToTodolists < ActiveRecord::Migration[5.1]
  def change
    remove_column :todolists, :done
  end
end
