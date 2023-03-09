# == Schema Information
#
# Table name: bids
#
#  id         :integer          not null, primary key
#  amount     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  listing_id :integer
#  user_id    :integer
#
class Bid < ApplicationRecord
  belongs_to(:listing)
  
end
