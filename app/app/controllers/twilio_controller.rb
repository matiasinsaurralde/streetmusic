require 'rubygems'
require 'twilio-ruby'

class TwilioController < ApplicationController
    def receive
        message_body = params["Body"]
        from_number = params["From"]

        SMSLogger.log_text_message from_number, message_body
    end

    def send
        number_to_send_to = params[:number_to_send_to]

        twilio_sid = "PNd0c2e6ab4dd1dc560f4fddec5067ca23"
        twilio_token = "9fe16dc5d670197e1bd8b4d368a0407e"
        twilio_phone_number = "6467366536"

        @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

        @twilio_client.account.sms.messages.create(
          :from => "+1#{twilio_phone_number}",
          :to => number_to_send_to,
          :body => "This is an message. It gets sent to #{number_to_send_to}"
        )
    end
end
