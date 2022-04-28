class Api::ReturnsController < ApplicationController

    def index
        returns = Client.find_by('id').returns
        render json: {status: 'SUCCESS', message: 'LOADED CLIENT RETURNS', data: returns}
    end

    def show
        returns = Client.find_by('id').returns.find_by('id') #cannot use return as a variable
        render json: {status: 'SUCCESS', message: 'LOADED CLIENT', data: returns}
    end

    def client_returns
        returns = Return.all 
        render json: returns, except: [:created_at, :updated_at]
    end

end