module Exponent
  class Notification
    @client = Exponent::Push::Client.new

    def self.send(tokens, subject, msg)
      message = []
      tokens.collect do |t|
        message << {
          to: "ExponentPushToken[#{t}]",
          title: subject,
          body: msg
        }
      end
      @client.publish message
    end
  end
end
