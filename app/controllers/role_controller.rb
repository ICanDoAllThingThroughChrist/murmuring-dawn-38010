class RolesController < ApplicationController
    def index 
        @roles = Role.all 
    end 
    def show 
        @role = Role.find(params[:id])
    end 
    def new
        #As a visitor I want to be able to 
        #purchase a role
        #just ask for first name, last name and email 
        @role = Role.new 
    end
    def create 
        #binding.pry
        @role = Role.new(role_params)
        if @role.save
            flash[:notice] = "new role created"
            redirect_to @role 
        else 
            flash[:alert] = "new role has not been created"
            render "new"
        end 
    end
    def edit
        @role = Role.find(params[:id])
    end
    def update 
        #binding.pry
        @role = Role.find(params[:id])
        if @role.update(role_params)
            flash[:notice] = "role has been updated."
            redirect_to @role
        else
            flash.now[:alert] = "role has not been updated."
            render "edit"
        end
    end
    private 
    def role_params 
        params.require(:role).permit(:id,:name)
    end
end
