module ApplicationHelper

  def date_presenter
    content = []
    (1..6).each do |x|
      content << "%th (#{Date.today - x}).strftime(\"%A. %d\")"
    end
  end

end
