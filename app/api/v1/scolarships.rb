module V1
  class Scolarships < Grape::API
    resource :scolarships do
      desc 'Get all scolarships'
      get do
        present Scolarship.all.order_by('date desc'), with: Entities::Scolarship
      end

      desc 'Create a scolarship'
      params do
        requires :name, type: String, desc: 'Scolarship name'
        requires :details, type: String, desc: 'Scolarship details'
        requires :deadline_date, type: Date, desc: 'Scolarship deadline date'
        requires :deadline_hour, type: String, desc: 'Scolarship deadline hour'
        requires :requeriments, type: Array, desc: 'Scolarship documents required'
      end
      post do
        ss = Scolarship.create_with_params params
        error! 'Unprocessable Entity', 422 unless ss.save
        present ss, with: Entities::Scolarship
      end

      desc 'Update a scolarship'
      params do
        requires :id, type: JSON, desc: 'Scolarship id'
        requires :name, type: String, desc: 'Scolarship name'
        requires :details, type: String, desc: 'Scolarship details'
        requires :deadline_date, type: Date, desc: 'Scolarship deadline date'
        requires :deadline_hour, type: String, desc: 'Scolarship deadline hour'
        requires :requeriments, type: Array, desc: 'Scolarship documents required'
      end
      put do
        error! 'Unprocessable Entity', 422 unless ss = Scolarship.update_with_params(params)
        present ss, with: Entities::Scolarship
      end

      desc 'Delete a scolarship'
      params do
        requires :id, type: JSON, desc: 'Scolarship id to delete'
      end
      delete do
        error! 'Not Found', 404 unless Scolarship.delete_with_params(params)
        status 200
      end
    end
  end
end
