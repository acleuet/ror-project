class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end

  layout :determine_layout
  
  def determine_layout
    module_name = self.class.to_s.split("::").first
    return (module_name.eql?("HomeController") ? "application" : "board")
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || dashboard_path
  end
end
