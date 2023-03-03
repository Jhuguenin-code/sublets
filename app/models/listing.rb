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
end
