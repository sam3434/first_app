class UsersController < ApplicationController
before_filter :authenticate, :except=>[:show, :new, :create]
before_filter :correct_user, :only => [:edit, :update]
before_filter :admin_user, :only=> :destroy
before_filter :no_register, :only=>[:new, :create]
  def new
@user=User.new
#@title="Sign up"
  end

def index
@users=User.paginate(:page=>params[:page])
end

def destroy
user=User.find(params[:id])
unless user.admin?
user.destroy 
redirect_to users_path, :success=>"Delete user"
else
redirect_to users_path, :notice=>"You admin!"
end
end

def show
@user=User.find(params[:id])
@microposts=@user.microposts.paginate(:page=>params[:page])
@title=@user.name
end

def update 
@user=User.find(params[:id])
if @user.update_attributes(params[:user])
flash[:success]="Update success"
redirect_to @user
#render 'show'
else
render 'edit'
#redirect_to edit_user_path(self)
end

end

def edit
@user=User.find(params[:id])
end

def create
@user=User.new(params[:user])
if @user.save
sign_in @user
flash[:success]="Success registration"
redirect_to @user
else
render 'new'
end
end

def following
@user=User.find(params[:id])
@users=@user.following.paginate(:page=>params[:page])
render 'show_follow'
end

def followers
@user=User.find(params[:id])
@users=@user.followers.paginate(:page=>params[:page])
render 'show_follow'
end

private 

def correct_user
@user=User.find(params[:id])
redirect_to home_path unless current_user?(@user)
end

def admin_user
redirect_to home_path unless current_user.admin?
end

def no_register
redirect_to home_path if signed_in?
end

end
