module V1
  class News < Grape::API
    resource :news do
      desc 'Get last 10 news'
      get do
        present New.all_ordered, with: Entities::New
      end

      desc 'Create a new'
      params do
        requires :title, type: String, desc: "New's title"
        requires :details, type: String, desc: "New's details"
        requires :img_dir, type: String, desc: "New's images directory"
        requires :img_num, type: String, desc: "New's images quantity"
        requires :important, type: String, desc: 'Is this new important? -> T,F'
      end
      post do
        anew = New.create_with_params params
        error! 'Unprocessable Entity', 422 unless anew.save
        anew.notificate if anew.important
        anew
      end

      resource :important do
        desc 'Get last 10 important news - for notification stash'
        get do
          present New.important, with: Entities::New
        end
      end
    end
  end
end
