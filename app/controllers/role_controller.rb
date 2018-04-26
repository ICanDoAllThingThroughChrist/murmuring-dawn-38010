class RolesController < ApplicationController
    def index 
        @roles = Role.all 
    end 
    def show 
        @role = Role.find(params[:id])
    end 
    def new
        #As a visitor I want to be able to 
        #purchase a subscription
        #just ask for first name, last name and email 
        @role = Role.new 
    end
    def create 
        binding.pry
        if @role.save
            flash[:notice] = "new role created"
            redirect_to @role 
        else 
            flash[:alert] = "new role has not been created"
            render "new"
        end 
    end
end
