module V1
  class Notifications < Grape::API
    resource :notifications do
      desc 'Send notification to token'
      params do
        requires :tokens, type: Array, desc: 'Device tokens'
        requires :title, type: String, desc: 'Notification title'
        requires :body, type: String, desc: 'Notification '
      end
      post do
        Exponent::Notification.send(params[:tokens], params[:title], params[:body])
        status 200
      end
    end
  end
end
