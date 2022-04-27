class Return < ApplicationRecord
  validates :time_estimate, :due_date, :return_type, :description, presence: true
  belongs_to :client
end
