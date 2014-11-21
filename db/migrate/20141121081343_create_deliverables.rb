class CreateDeliverables < ActiveRecord::Migration
  def change
    create_table :deliverables do |t|
      t.string :name
      t.float :expected_hours
      t.float :completed_hours
      t.integer :project_id

      t.timestamps
    end
  end
end
