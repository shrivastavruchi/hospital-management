class UserController < ApplicationController
	before_action :find_user, :only=>[:edit,:update]

	def index
		authorize! :read, User
		@users = User.all_except(current_user)
	end	

	def new
		authorize! :create, User
		@user =User.new
	end

	def create
	
		authorize! :create, User
		@user = User.new(params_user)
    if @user.save
    	@user.send_sms
    	UserMailer.welcome_email(@user,@password).deliver
      unless params[:roles].blank?
        add_roles(params[:roles])
      end
      redirect_to user_index_path, :notice => "User successfully created"
    else
      render :action => :new
    end
	end	

	def edit
	authorize! :edit, User
	end	

	def update
		authorize! :update, User
		if @user.update(params_user)
			unless params[:roles].blank?
				@user.roles.delete_all
				add_roles(params[:roles])
			end
			redirect_to user_index_path, :notice => "User successfully updated"
		end	
	end	
	
	private 

	def params_user
    params.require(:user).permit(:name, :age, :email, :type, :password, :password_confirmation,:department_id,:phone_no,:specilization)
  end

  def find_user
  	@user = User.find(params[:id]) 
  end	

 	def add_roles(roles)
    roles.each do |role|
      @user.add_role role
    end
  end
end
