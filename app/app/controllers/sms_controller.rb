require 'twilio-ruby'

class SmsController < ApplicationController
  skip_before_filter :force_ssl # You may need this if your app uses https normally
  skip_before_filter :verify_authenticity_token

  def create

    # render text: "test"
    # Do something with params['From'] -- contains the phone number the SMS came from
    # Do something with params['Body'] -- contains the text sent in the SMS

    # <Reponse/> is the minimum to indicate a "no response" from Twilio
    render xml: "
        <Response>
            <Message>Hey Monkey. Thanks for the message!</Message>
        </Response>"
  end
end
