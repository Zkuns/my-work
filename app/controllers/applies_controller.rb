class AppliesController < ApplicationController
  before_action :check_login
  
  def checkin_page
    @activities = Activity.all.order(:created_at)
    if params[:id]
      @applies = Apply.where('activity_id = ? and checkin = ?', params[:id], true).order(updated_at: :desc)
    end
  end

  def cancel
    apply = Apply.find(params[:id].to_i)
    apply.update_attribute(:checkin,false)
    @applies = Apply.where('activity_id = ? and checkin = ?', params[:activity_id], true)
    respond_to do |format|
      format.js
    end
  end

  def import
    if params[:id]
      url =  applies_url params[:id]
      data = JSON.parse(open(url).read)
      data.each do |applies|
        applies[:activity_id] = params[:id]
      end
      applies = Apply.find_by(:activity, params[:id])
      applies.delete unless applies.nil?
      Apply.create(data)
    end
    respond_to do |format|
      format.js
    end
  end

private

 def check_login
    redirect_to login_path unless current_user && current_user.admin?
    puts current_user
 end
end
