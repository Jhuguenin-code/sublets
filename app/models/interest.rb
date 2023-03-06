# == Schema Information
#
# Table name: interests
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  listing_id :integer
#  user_id    :integer
#
class Interest < ApplicationRecord
  validates(:listing_id, { :presence => true })
  #validates(:listing_id, { :uniqueness => true })-not sure about this line
  
  belongs_to(:favoriter, {
    :class_name => "User",
    :foreign_key => "user_id",
    :required => true
  })

  belongs_to(:listing, {
    :class_name => "Listing",
    :foreign_key => "listing_id",
    :required => true
  })
end
