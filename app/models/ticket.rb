class Ticket < ActiveRecord::Base
  belongs_to :registration
  belongs_to :activity
end
