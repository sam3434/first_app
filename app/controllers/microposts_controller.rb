class MicropostsController < ApplicationController
before_filter :authenticate
before_filter :auto_user, :only=>[:destroy]



def create
@micropost=current_user.microposts.build(params[:micropost])
if @micropost.save
	flash[:success]="New message added"
	redirect_to home_path
else
	render 'pages/home'
end
end

def destroy
@micropost.destroy
redirect_back_or home_path
end


private

def auto_user
@micropost=current_user.microposts.find_by_id(params[:id])
redirect_to home_path if @micropost.nil?
end

end
