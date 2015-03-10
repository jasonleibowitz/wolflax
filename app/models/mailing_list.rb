class MailingList

  mc = Mailchimp::API.new(ENV['MAILCHIMP-API-KEY'])

  def self.subscribe(camper)
    gb = Gibbon::API.new
    mobile_phone = Phoner::Phone.parse camper.mobile_phone, :country_code => '1'
    subscribe = gb.lists.subscribe({
      :id => 'b630bc5792',
      :email =>
        {:email => camper.email},
      :merge_vars =>
        {
          :FNAME => camper.first_name,
          :LNAME => camper.last_name,
          :groupings =>
            {
              0 => {:name => camper.camp.report_name, :groups => [camper.camp.report_name]}
            }
        },
      :update_existing => true,
      :double_optin => false
      })
    binding.pry
  end


end
