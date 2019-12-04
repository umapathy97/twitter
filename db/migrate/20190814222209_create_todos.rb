class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :task
      t.string :priority
      t.string :deadline
      t.string :reminder

      t.timestamps
    end
  end
end
