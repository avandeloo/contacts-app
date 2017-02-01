class Contact < ApplicationRecord
  belongs_to :user
  
  def full_name
    "#{first_name}#{'' + middle_name if middle_name} #{last_name}".titleize
    # full_name = ""
    # full_name += first_name.upcase if first_name != nil 
    # full_name += " " if first_name != nil && last_name != nil
    # full_name += last_name.upcase if last_name != nil
    # full_name
  end

  def address_convert(address)
    coordinates = Geocoder.coordinates(address)    
  end

  def friendly_updated_at
    updated_at.strftime('%b %d, %Y')
  end

  def display_phone_prefix
    number = phone_number
    number.prepend("+81 ") if number.length >= 8 && number.length < 10
    number
  end

  def created_by
    user.name
  end
end
