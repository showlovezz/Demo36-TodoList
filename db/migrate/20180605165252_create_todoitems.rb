class CreateTodoitems < ActiveRecord::Migration[5.1]
  def change
    create_table :todoitems do |t|
      t.string :content
      t.integer :todolist_id
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
