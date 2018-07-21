class ItemsController < ApplicationController
    include SessionsHelper
    # before_action :admin, only => [:new, :create]
    # load_and_authorize_resource :nested => :box
    def index
        @items = Item.all
    end
    def new
            @user= current_user
            #@boxes= @user.boxes.pluck(:title, :id)
            @boxes= Box.pluck(:title, :id)
            #@boxex= Box.group(:title).pluck(:title, :id)
            #@boxes= Box.group(:title).where(:shipped == "false")
            @item = Item.new
        #https://stackoverflow.com/questions/48285481/how-do-you-use-a-single-select-dropdown-with-rails-has-many-through-association
    end
    def create
        #binding.pry
        if current_user.role_id == 3
            @item = Item.new(item_params)
            if @item.save 
            flash[:notice] = "item has been created."
            redirect_to @item 
            else
            flash[:alert] = "item has not been created."
            render "new"
            end
        else 
            flash[:notice] = "You are not authorized to perform this action" 
        end    
    end
    def show
        @item = Item.find(params[:id])
    end
    def edit
        @user= current_user
        @boxes= @user.boxes.pluck(:title, :id)
        @item = Item.find(params[:id])
    end
    def update 
        #binding.pry
        @item = Item.find(params[:id])
       
        if @item.update(item_params)
            flash[:notice] = "item has been updated."
            redirect_to @item
          else
            flash.now[:alert] = "item has not been updated."
            render "edit"
        end

    end 
    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        flash[:notice] = "item has been deleted."
        redirect_to items_path
    end

I found solution to this problem here

Answer:

def download
  extension = File.extname(@asset.file_file_name)
  send_data open("#{@asset.file.expiring_url(10000, :original)}").read, filename: "original_#{@asset.id}#{extension}", type: @asset.file_content_type
end

private
    def item_params
        params.require(:item).permit(:title, :description, :URL, :avatar, box_ids:[])
    end
#As an administrator I want to be able to 
# add a new item to a box"=>Admin::BoxItemsController#New;
#Create" (title, description, image, size, URL to buy 
# more from amazon or other partners)
end
