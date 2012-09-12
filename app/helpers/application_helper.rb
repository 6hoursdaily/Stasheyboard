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

# query on the console that delivers all statuses for a day

# Service.last.statuses.where("DATE(created_at) = DATE(?)", Date.today)


  def status_for_service_at(service_id, date)
    s = Service.find_by_id(service_id)
    days_statuses = s.statuses.where{created_at > date.beginning_of_day and
      created_at < date.end_of_day}
  end


  def current_status(id)
    s = Service.find_by_id(id)
    s.statuses.where("DATE(created_at) = DATE(?)", Date.today).last.name
  end

end
