    class Api::ClientsController < ApplicationController

        def index
            clients = Client.order('name')
            render json: {status: 'SUCCESS', message: 'LOADED CLIENTS', data: clients}
        end

        def show
            client = Client.find_by('id')
            render json: {status: 'SUCCESS', message: 'LOADED CLIENT', data: client}
        end

    end