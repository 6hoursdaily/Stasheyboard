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

  def date_helper(n)
    "#{(Date.today - n).strftime("%b. %d")}"
  end


  def service_status_at(service_id, date)
    s = Service.find_by_id(service_id, :include => :statuses)
    weekly_stats = s.statuses.where("DATE(created_at) <= DATE(?) and DATE(created_at) > DATE(?)",
      Time.zone.now, (Time.zone.now - 7.days))
    status = weekly_stats.where("DATE(created_at) = DATE(?)", date).last
    if status.blank?
      status = weekly_stats.where("DATE(created_at) < DATE(?)", date).last
    end
    if status.blank?
      status = s.statuses.where("DATE(created_at) < DATE(?)", date).last
    end
    image_for_status(status.name)
  end 

end
