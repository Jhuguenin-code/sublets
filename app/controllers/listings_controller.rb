class ListingsController < ApplicationController
  def index
    matching_listings = Listing.all

    @list_of_listings = matching_listings.order({ :created_at => :desc })

    render({ :template => "listings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_listings = Listing.where({ :id => the_id })

    @the_listing = matching_listings.at(0)

    render({ :template => "listings/show.html.erb" })
  end

  def create
    the_listing = Listing.new
    the_listing.street_address = params.fetch("query_street_address")
    the_listing.unit_number = params.fetch("query_unit_number")
    the_listing.city = params.fetch("query_city")
    the_listing.zip_code = params.fetch("query_zip_code")
    the_listing.info = params.fetch("query_info")
    the_listing.bathrooms = params.fetch("query_bathrooms")
    the_listing.bedrooms = params.fetch("query_bedrooms")
    the_listing.current_rent = params.fetch("query_current_rent")
    the_listing.sublet_rent = params.fetch("query_sublet_rent")
    the_listing.poster = params.fetch("query_poster")
    the_listing.image = params.fetch("query_image")

    if the_listing.valid?
      the_listing.save
      redirect_to("/listings", { :notice => "Listing created successfully." })
    else
      redirect_to("/listings", { :alert => the_listing.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_listing = Listing.where({ :id => the_id }).at(0)

    the_listing.street_address = params.fetch("query_street_address")
    the_listing.unit_number = params.fetch("query_unit_number")
    the_listing.city = params.fetch("query_city")
    the_listing.zip_code = params.fetch("query_zip_code")
    the_listing.info = params.fetch("query_info")
    the_listing.bathrooms = params.fetch("query_bathrooms")
    the_listing.bedrooms = params.fetch("query_bedrooms")
    the_listing.current_rent = params.fetch("query_current_rent")
    the_listing.sublet_rent = params.fetch("query_sublet_rent")
    the_listing.poster = params.fetch("query_poster")
    the_listing.image = params.fetch("query_image")

    if the_listing.valid?
      the_listing.save
      redirect_to("/listings/#{the_listing.id}", { :notice => "Listing updated successfully."} )
    else
      redirect_to("/listings/#{the_listing.id}", { :alert => the_listing.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_listing = Listing.where({ :id => the_id }).at(0)

    the_listing.destroy

    redirect_to("/listings", { :notice => "Listing deleted successfully."} )
  end
end
