class ClientsController < ApplicationController

    def index
        clients = Client.all 
        render json: clients
    end

    def show
        client = Client.find_by(id: params[:id])
        if client
            render json: client
        else
            render json: { error: 'Client  not found'}, status: :not_found
        end
    end

    def update
        client = Client.find(params[:id])
        client.update(client_params)
        if client.valid?
            render json: client
        else
            render json: { errors: client.errors }, status: :unprocessable_entity
        end

    end

    private

    def client_params
        params.permit(:name, :age)
    end
end

