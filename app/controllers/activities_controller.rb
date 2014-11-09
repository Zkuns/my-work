class ActivitiesController < ApplicationController
    require 'open-uri'

  def save
    url =  activities_url
    data = JSON.parse(open(url).read)
    Activity.delete_all
    data.each do |activity|
      Activity.create(title: activity['title'], id: activity['id'])
    end
    respond_to do |format|
      format.js
    end
  end

end
