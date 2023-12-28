class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :comments

    validates :first_name, before_save {self.first_name = first_name.downcase}, presence :true
    validates :last_name, before_save {self.last_name = last_name.downcase}, presence :true
    validates :email, before_save {self.email = email.downcase}, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum:8, maximum:16}
end
