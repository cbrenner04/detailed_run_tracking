# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  around_action :convert_time_zone, if: :current_user

  private

  def convert_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
