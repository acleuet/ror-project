module ApplicationHelper

  def hello_member
    if current_user.nil?
      "Bonjour,"
    else
      "Bonjour Antoine,"
    end
  end
end
