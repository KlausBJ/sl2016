class AddRegistrationToActivity < ActiveRecord::Migration
  def change
    add_reference :activities, :registration, index: true, foreign_key: true
  end
end
