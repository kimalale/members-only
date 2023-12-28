class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, before_save {self.title = title.capitalize}, presence :true
  validates :body, presence: true, length: {minimum: 8 }

  def author?
    self.user_id == current_user.id
  end
end
