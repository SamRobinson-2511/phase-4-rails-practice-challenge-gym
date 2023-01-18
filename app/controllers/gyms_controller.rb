class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :gym_not_found

    def show
        gym = Gym.find(params[:id])
        render json: gym, status: 200
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy
        head :no_content
    end

    private

    def gym_params
        params.require(:gym).permit(:name, :address)
    end

    def gym_not_found
        render json: {errors: ['Gym not found']}, status: 404
    end
end
