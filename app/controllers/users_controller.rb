class UsersController < ApplicationController
    def quit
        
    end

    def update
        @user = current_user
        if @user.update(user_params)
            redirect_to user_path
        else
            render "edit"
        end
    end
    
    def edit
        @user = current_user
    end

    private
        def user_params
            params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :status)
        end

end
