class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update, :destroy, :following, :followers]
  def index
    @users = User.all
    @users = User.paginate(page: params[:page])
end
  def show
  	@user = User.find(params[:id])
  	@microposts = @user.microposts.paginate(page: params[:page])

  end
def test
 user=User.first

  followed= User.find(params[:id])
  
   user.follow!(followed) 
  


end
  def new
  	  @user = User.new
  end

def create

    @user = User.new(params[:user])
    if @user.save
    	flash[:success] = "Welcome to the Sample App!"
    	redirect_to @user
      
    else
      render 'new'
    end
end
def edit
    @user = User.find(params[:id])
    end
     def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
end
def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
 private
def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end

