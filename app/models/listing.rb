# == Schema Information
#
# Table name: listings
#
#  id             :integer          not null, primary key
#  bathrooms      :integer
#  bedrooms       :integer
#  city           :string
#  current_rent   :integer
#  image          :string
#  info           :text
#  poster         :integer
#  street_address :string
#  sublet_rent    :integer
#  unit_number    :integer
#  zip_code       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Listing < ApplicationRecord
  belongs_to(:a_poster, {
    :class_name => "User",
    :foreign_key => "poster",
    :required => true
  })

  has_many(:favorites, {
    :class_name => "Interest",
    :foreign_key => "listing_id",
    :dependent => :destroy
  })

  
end
