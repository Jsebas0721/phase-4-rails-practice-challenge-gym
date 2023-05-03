class GymsController < ApplicationController

    def index
        gyms = Gym.all 
        render json: gyms
    end

    def show
        gym = Gym.find_by(id: params[:id])
        if gym
            render json: gym
        else
            render json: { error: 'Gym  not found'}, status: :not_found
        end
    end

    def update
        gym = Gym.find(params[:id])
        gym.update(gym_params)
        if gym.valid?
            render json: gym
        else
            render json: { errors: gym.errors }, status: :unprocessable_entity
        end

    end

    def destroy
        gym = Gym.find_by(id: params[:id]) 
        if gym
           gym.destroy
           head :no_content
        else
            render json: { error: 'Gym not found'}, status: :not_found
        end
    end

    private

    def gym_params
        params.permit(:name, :address)
    end
end
