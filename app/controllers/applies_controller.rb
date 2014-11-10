class AppliesController < ApplicationController
  before_action :check_login

  def uptoserver
    activity_id = Activity.find_by(actived: true).id
    @url = applies_url(activity_id.to_s)
    applies = Apply.where('activity_id = ? and checkin = ?', activity_id, true).order(updated_at: :desc)
    @data = applies.map( &:email ).to_json
    respond_to do |format|
      format.js
    end
  end

  def checkin_page
    @activities = Activity.all.order(:created_at)
    @activities.each{ |activity| activity.update_attribute(:actived, false) }
    if params[:id]
      Activity.find(params[:id]).update_attribute(:actived, true)
      @applies = Apply.where('activity_id = ? and checkin = ?', params[:id], true).order(updated_at: :desc)
    end
  end

  def search
    key = params[:keyword]
    @result = search_apply(@@applies, key)
    @applies = Apply.where('activity_id = ? and checkin = ?', Activity.find_by(actived: true).id, true).order(updated_at: :desc)
    if @result.size == 1
      @result[0].update_attribute(:checkin, true)  
    end
    respond_to do |format|
      format.js
    end
  end

  def prepare
    @@applies = Activity.find_by(actived: true).applies
    respond_to do |format|
      format.js
    end
  end

  def cancel
    apply = Apply.find(params[:id].to_i)
    apply.update_attribute(:checkin,false)
    @applies = Apply.where('activity_id = ? and checkin = ?', params[:activity_id], true).order(updated_at: :desc)
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
      Apply.delete_all(activity_id: params[:id])
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
