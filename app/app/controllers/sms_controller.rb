class SmsController < ApplicationController
  skip_before_filter :force_ssl # You may need this if your app uses https normally
  TWILIO_SID = 'AC2a3e7b30d28bae4ca313834c1c07bd63'
  TWILIO_AUTH_TOKEN = 'de74b27c8306aab8f8544e652d2fb515'

  def create
    client = Twilio::REST::Client.new(TWILIO_SID, TWILIO_AUTH_TOKEN)
    client.account.messages.create(
      :from => '+14432192344',
      :to => '+14438516506',
      :body => 'Hey there!'
    )
  end
end
