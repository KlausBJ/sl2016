class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :navn
      t.string :sted
      t.integer :dag
      t.time :tid

      t.timestamps null: false
    end
  end
end
