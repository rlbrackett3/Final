class UsersController < ApplicationController
def index
    @users = User.all
    if @users.present?
      flash[:notice] = "Users display successfully."
    else
      flash[:alert] = "Sorry, there were no users to display."
  end
end

  def show
    @user = User.find(params[:id])
  end

    def edit
      @user = User.find(params[:id])
    end

    def new
      @user = User.new 

    end
    
    def create
    @user = User.new(params_users)
    @user.save
    if @users.save
      flash[:notice] = "Your account has been saved successfully!"
      redirect_to users_path
    else  
      flash[:alert] = "We've experienced a problem, your account could not be saved"
      redirect_to root_path 
    end

    end

    def destroy
    @user = User.find(params[:id])
  
      if @user.destroy
      flash[:notice] = "You've been destroyed!"
      else 
        flash[:alert] = "You must be impervious to deletion"
      end
      redirect_to users_path 
    end

     def update
       @user = User.find(params[:id])
       if @user.update(params_users)
      flash[:notice] = "User info was updated"
      else 
        flash[:alert] = "You must be impervious to update"
      end
      redirect_to users_path

      end

    private

    def params_users
    params.require(:user).permit(:username, :email, :password)
    end

end 


