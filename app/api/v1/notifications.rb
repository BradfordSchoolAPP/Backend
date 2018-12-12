module V1
  class Notifications < Grape::API
    resource :notifications do
      desc 'Send notification to token'
      params do
        requires :token, type: String, desc: 'Device token'
        requires :title, type: String, desc: 'Notification title'
        requires :body, type: String, desc: 'Notification '
      end
      post do
        Exponent::Notification.send(params[:token], params[:title], params[:body])
        status 200
      end
    end
  end
end
