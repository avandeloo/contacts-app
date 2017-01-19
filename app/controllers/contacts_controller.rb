class ContactsController < ApplicationController
  def one_contact
    @contact = Contact.first
  end

  def all_contacts
    @contacts = Contact.all
  end

  def get_contact_form
    
  end

  def use_contact_form
    @contact = Contact.new(
                          first_name: params["first_name"],
                          last_name: params["last_name"],
                          email: params["email"],
                          phone_number: params["phone_number"]
                        )
    @contact.save

  end


end
