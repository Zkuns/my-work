class AppliesController < ApplicationController
  before_action :check_login
  
  def checkin_page
    
  end

private

 def check_login
    redirect_to login_path unless current_user && current_user.admin?
    puts current_user
 end
end
