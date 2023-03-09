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
  validates(:street_address, { :presence => true })
  validates(:unit_number, { :presence => true })
  validates(:city, { :presence => true })
  validates(:zip_code, { :presence => true })
  validates(:bedrooms, { :presence => true })
  validates(:bathrooms, { :presence => true })
  validates(:current_rent, { :presence => true })

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

  has_many(:bids, {
    :class_name => "Bid",
    :foreign_key => "listing_id",
    :dependent => :destroy
  })

  
end
