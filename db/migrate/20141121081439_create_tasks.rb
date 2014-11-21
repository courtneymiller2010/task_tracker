class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.float :date
      t.float :completed_hours
      t.integer :deliverable_id
      t.integer :project_id
      t.integer :status
      t.text :description

      t.timestamps
    end
  end
end
