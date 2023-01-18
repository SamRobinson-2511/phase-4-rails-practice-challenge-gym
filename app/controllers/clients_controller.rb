class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :client_not_found

    def show
        client = Client.find(params[:id])
        render json: client, include: :memberships, status: 200
    end

    private
    def client_not_found
        render json: {errors: ['Client not found']}, status: :not_found
    end
end
