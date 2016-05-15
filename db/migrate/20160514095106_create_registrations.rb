class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :voksen
      t.integer :ung
      t.integer :boern
      t.integer :baby
      t.belongs_to :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
