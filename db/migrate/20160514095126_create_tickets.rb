class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :deltager
      t.belongs_to :member, index: true, foreign_key: true
      t.belongs_to :activity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
