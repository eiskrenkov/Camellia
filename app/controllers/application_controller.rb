class ApplicationController < ActionController::Base
  include UserIdentification
  include NavigationSupport

  inherit_resources

  protect_from_forgery with: :null_session
end
