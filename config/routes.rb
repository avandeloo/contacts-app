Rails.application.routes.draw do
  get '/one_contact_url' => 'contacts#one_contact'
  get '/all_contacts_url' => 'contacts#all_contacts'

  get '/contact_form_param_url' => 'contacts#get_contact_form'
  post '/contact_form_result_url' => 'contacts#use_contact_form'

end
