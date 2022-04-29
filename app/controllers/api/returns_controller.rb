class Api::ReturnsController < ApplicationController

    def index
        @returns = Return.all
        @returns = @returns.where(client_id: params[:client_id]) if params[:client_id]

        render json: {status: 'SUCCESS', message: 'LOADED CLIENT RETURNS', data: @returns}
    end

    def show
        returns = Return.find_by(id: params[:id]) #cannot use return as a variable
        render json: {status: 'SUCCESS', message: 'LOADED CLIENT', data: returns}
    end

    def create
        tax_return = Return.create(return_params)
        render json: {data: tax_return}
    end

    def client_returns
        returns = Return.all 
        render json: returns, except: [:created_at, :updated_at]
    end

    private 

    def return_params
       params.require(:return).permit(:return_type, :client_id, :description, :time_estimate, :due_date)
    end


end