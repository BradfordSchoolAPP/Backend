module Exponent
  class Notification
    @client = Exponent::Push::Client.new

    def self.send(tokens, subject, msg)
      message = []
      tokens.collect do |t|
        message << {
          to: "ExponentPushToken[#{t}]",
          title: subject,
          body: msg,
          data: {
            json: {
              type: 'alerta'
            }
          }
        }
      end
      @client.publish message
    end

    def self.send_new(tokens, title, details, date, img_dir)
      message = []
      tokens.collect do |t|
        message << {
          to: "ExponentPushToken[#{t}]",
          title: 'Nueva Noticia!',
          body: title,
          data: {
            json: {
              type: 'noticia',
              title: title,
              details: details,
              date: date,
              img_dir: img_dir
            }
          }
        }
      end
      @client.publish message
    end
  end
end
