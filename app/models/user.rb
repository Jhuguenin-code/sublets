# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:individual_listings, {
    :class_name => "Listing",
    :foreign_key => "poster",
    :dependent => :destroy
  })
  

  def full_name
    return first_name + " " + last_name
  end
end
