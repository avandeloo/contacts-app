class ContactsController < ApplicationController

  def index
    @contacts = Contact.all

    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    search_term = params[:search_term]

    if search_term
      @contacts = @contacts.where("first_name iLIKE ? OR last_name iLIKE ?", 
                                "%#{search_term}%",
                                "%#{search_term}%")
    end
    
    if sort_attribute && sort_order
      @contacts = @contacts.order(sort_attribute => sort_order)
    end

  end  

  def new
    
  end

  def create
    address = params["address"]
    latitude = Geocoder.coordinates(:address)[0]
    longitude = Geocoder.coordinates(:address)[1]
    contact = Contact.new(
                          first_name: params["first_name"],
                          middle_name: params["middle_name"],
                          last_name: params["last_name"],
                          email: params["email"],
                          phone_number: params["phone_number"],
                          bio: params["bio"],
                          longitude: longitude,
                          latitude: latitude,
                          user_id: current_user.id
                        )
    redirect_to "/contacts/#{contact.id}"
    contact.save

  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])

    contact.assign_attributes(
                              first_name: params[:first_name],
                              middle_name: params[:middle_name],
                              last_name: params[:last_name],
                              email: params[:email],
                              phone_number: params[:phone_number],
                              bio: params[:bio],
                              longitude: params[Geocoder.coordinates(:address)[0]],
                              latitude: params[Geocoder.coordinates(:address)[1]]
                              )
    redirect_to "/contacts/#{contact.id}"
    contact.save

  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    redirect_to "/contacts"
  end

end
