class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update]
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

    #before_action :set_subscription
    before_action :admin_user, only: :destroy
    #https://stackoverflow.com/questions/23585871/implementing-multiple-user-roles
    def index 
        @users = User.order(:last_name)
    end 
    def show 
        @user = User.find(params[:id])
        redirect_to subscriptions_path
    end 
    
    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            UserMailer.account_activation(@user).deliver_now
               flash[:info] = "Please check your email to activate your account"
            redirect_to root_url
        else 
            flash.now[:danger] = 'failed validations'
            redirect_to root_url
        end 
    end 

    def update 
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            flash[:success] = "Updated"
        else 
            render 'edit'
        end
    end 

    def destroy 
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to users_url 
    end

    def generate_new_password_email user =
        User.find(params[:user_id]) 
        user.send_reset_password_instructions 
        flash[:notice] = "Reset passwordpassword instructions have been sent to #{user.email}." 
        redirect_to admin_user_path(user)
    end

    private 
    def user_params 
        params.require(:user).permit(:first_name, :last_name, :email, :password,
                                     :password_confirmation, :role_id)
    end 
    def logged_in_user
        unless logged_in?
            flash[:danger] = "Please log in"
            redirect_to login_url 
        end
    end

    def correct_user 
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user 
        redirect_to(root_url) unless current_user.admin?
    end
# Use callbacks to share common setup or constraints between actions.
    def set_user
    @user = User.find(params[:id])
    end
    def set_s3_direct_post
        @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    end
    # def set_subscription 
    #     @subscription = Subscription.find(params[:subscription_id])
    # end
end
