class AddActivityToTask < ActiveRecord::Migration
  def change
    add_reference :tasks, :activity, index: true, foreign_key: true
  end
end
