class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :name
      t.belongs_to :member, index: true, null: false, foreign_key: true
      t.belongs_to :ticket_type, index: true, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
