module ApplicationHelper

  def date_presenter
    contents = []
    content_tag :th do
      (1..6).each do |x|
        contents << (Date.today - x).strftime("%a. %d")
        contents
      end
    end
  end

  def dates_presenter
    (1..6).each do |x|
      "#th #{(Date.today - x).strftime("%a. %d")}"
    end
  end


  def status_for_service_at(service_id, date)
    s = Service.find_by_id(service_id)
    days_statuses = s.statuses.where{created_at > date.beginning_of_day and
      created_at < date.end_of_day}
  end


  def current_status(id)
    s = Service.find_by_id(id)
    s.statuses.where("DATE(created_at) = DATE(?)", Date.today).last.name
  end


  def current_status(id)
    s = Service.find_by_id(id)
    todays_stats = s.statuses.where("DATE(created_at) = DATE(?)", Date.today)
    if todays_stats.blank?
      status = s.statuses.last.name
    else
      status = todays_stats.last.name
    end
    image_for_status(status)
  end

  def image_for_status(status)
    if status == "Up"
      image_tag "tick-circle.png"
    elsif status == "Down"
      image_tag "cross-circle.png"
    elsif status == "Troubled"
      image_tag "traffic-cone.png"
    end
  end

  def service_status_at(service_id, date)
    s = Service.find_by_id(service_id)
    weekly_stats = s.statuses.where.
      ("DATE(created_at) <= DATE(?) and DATE(created_at) > DATE(?)",
      Date.today, (Date.today - 7))
    status = weekly_stats.where("DATE(created_at) = DATE(?)", date).last.name
    if status.blank?
      status = weekly_stats.where("DATE(created_at < DATE(?)", date).last.name
    end
    image_for_status(status)
  end 

end
