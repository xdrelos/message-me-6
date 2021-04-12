class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  scope :render_msg_limited, -> { order('created_at').last(20)}
end
