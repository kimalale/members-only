class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true, length: {minimum: 6}

  def commenter?
    self.user_id == current_user.id
  end
end
