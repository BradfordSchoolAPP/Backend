module Exponent
  class Notification
    @client = Exponent::Push::Client.new

    def self.send(token, subject, msg)
      message = [{
        to: "ExponentPushToken[#{token}]",
        title: subject,
        body: msg
      }]
      @client.publish message
    end
  end
end
