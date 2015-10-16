class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.date :due_on
      t.float :priority
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
