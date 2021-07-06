class ApplicationController < ActionController::Base
  layout :define_layout

  def after_sign_in_path_for(_resource)
    arrows_root_path
  end

  private

  def define_layout
    devise_controller? ? 'landing' : 'application'
  end
end
