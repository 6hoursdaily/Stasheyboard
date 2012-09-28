module ApplicationHelper

  def image_for_status(status)
    if status == "Up"
      image_tag "tick-circle.png"
    elsif status == "Down"
      image_tag "cross-circle.png"
    elsif status == "Troubled"
      image_tag "traffic-cone.png"
    end
  end

  def current_status(id)
    s = Service.find_by_id(id)
    image_for_status(s.statuses.last.name)
  end

  def service_status_at(service_id, date)
    s = Service.find_by_id(service_id)
    weekly_stats = s.statuses.where("DATE(created_at) <= DATE(?) and DATE(created_at) > DATE(?)",
      Date.today, (Date.today - 7))
    status = weekly_stats.where("DATE(created_at) = DATE(?)", date).last.name
    if status.blank?
      status = weekly_stats.where("DATE(created_at < DATE(?)", date).last.name
    end
    image_for_status(status)
  end 

  def message_helper(service_id)
    s = Service.find(service_id)
    unless s.statuses.last.message.nil?
      s.statuses.last.message
    else
      "Unknown"
    end
  end


end
