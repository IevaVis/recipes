class UsersController < ApplicationController

def index
	@users = User.all
end

def new
	@user = User.new
end


def create
	@user = User.new(valid_params)
	if @user.save
		log_in @user
		redirect_to user_path(@user)
		flash[:notice] = "Account created!"
	else
		flash[:alert] = "Error creating account. Please try again!"
		render :new
	end
end

def show
	@user = User.find(params[:id])
end

def edit
	@user = User.find(params[:id])
end

def update
	@user = User.find(params[:id])
	if @user.update_attributes(valid_params)
		flash[:notice] = "Account is updated successfully!"
		redirect_to user_path(@user)
	else
		flash[:alert] = "Error editing account. Please try again!"
		render :edit
	end
end

def destroy
	@user = User.find(params[:id])
	@user.destroy
	flash[:notice] = "Account is deleted!"
	redirect_to root_path
end

private
def valid_params
	params.require(:user).permit(:name, :email, :password)
end

end
