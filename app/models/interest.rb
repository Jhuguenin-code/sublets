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
end