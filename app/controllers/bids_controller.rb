class BidsController < ApplicationController
  def index
    matching_bids = Bid.all

    @list_of_bids = matching_bids.order({ :created_at => :desc })

    render({ :template => "bids/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bids = Bid.where({ :id => the_id })

    @the_bid = matching_bids.at(0)

    render({ :template => "bids/show.html.erb" })
  end

  def create
    the_id = params.fetch("path_id")
    the_listing = Listing.where({ :id => the_id }).at(0)
    
    the_bid = Bid.new
    the_bid.listing_id = params.fetch("query_listing_id")
    the_bid.user_id = params.fetch("query_user_id")
    the_bid.amount = params.fetch("query_amount")

    if the_bid.valid?
      the_bid.save
      redirect_to("/listings/#{the_listing.id}", { :notice => "Bid created successfully." })
    else
      redirect_to("/listings/#{the_listing.id}", { :alert => the_bid.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_bid = Bid.where({ :id => the_id }).at(0)

    the_bid.listing_id = params.fetch("query_listing_id")
    the_bid.user_id = params.fetch("query_user_id")
    the_bid.amount = params.fetch("query_amount")

    if the_bid.valid?
      the_bid.save
      redirect_to("/bids/#{the_bid.id}", { :notice => "Bid updated successfully."} )
    else
      redirect_to("/bids/#{the_bid.id}", { :alert => the_bid.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bid = Bid.where({ :id => the_id }).at(0)

    the_bid.destroy

    redirect_to("/bids", { :notice => "Bid deleted successfully."} )
  end
end
