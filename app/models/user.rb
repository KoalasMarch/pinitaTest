# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  before_save :downcase_email

  validates :email, presence: true
  validates :password, presence: true

  def as_json
    json = {}
    json[:email] = self.email
    json
  end

  def downcase_email
    self.email = self.email.downcase
  end
end
