class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to :member, index: true, foreign_key: true
      t.belongs_to :task, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
