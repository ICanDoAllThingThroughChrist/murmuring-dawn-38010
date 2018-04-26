class RoleController < ApplicationController
    def new
        #As a visitor I want to be able to 
        #purchase a subscription
        #just ask for first name, last name and email 
        @role = Role.new 
    end
end
