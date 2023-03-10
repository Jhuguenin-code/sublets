class InterestsController < ApplicationController
  def index
    matching_interests = @current_user.favorites

    @list_of_interests = matching_interests.order({ :created_at => :desc })

    render({ :template => "interests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_interests = Interest.where({ :id => the_id })

    @the_interest = matching_interests.at(0)

    render({ :template => "interests/show.html.erb" })
  end

  def create
    the_interest = Interest.new
    the_interest.listing_id = params.fetch("query_listing_id")
    the_interest.user_id = session.fetch(:user_id)


    if the_interest.valid?
      the_interest.save
      redirect_to("/interests", { :notice => "This listing is now favorited! Place a bid!" })
    else
      redirect_to("/interests", { :alert => the_interest.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_interest = Interest.where({ :id => the_id }).at(0)

    the_interest.listing_id = params.fetch("query_listing_id")
    the_interest.user_id = params.fetch("query_user_id")

    if the_interest.valid?
      the_interest.save
      redirect_to("/interests/#{the_interest.id}", { :notice => "Interest updated successfully."} )
    else
      redirect_to("/interests/#{the_interest.id}", { :alert => the_interest.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_interest = Interest.where({ :id => the_id }).at(0)

    the_interest.destroy

    redirect_to("/interests", { :notice => "Interest deleted successfully."} )
  end
end
