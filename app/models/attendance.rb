class Attendance < ApplicationRecord
  after_create :confirmation_send

  def confirmation_send
    EventMailer.confirmation_email(self).deliver_now
  end

  belongs_to :user
  belongs_to :event
end
