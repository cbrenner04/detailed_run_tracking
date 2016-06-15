# frozen_string_literal: true
class Run < ActiveRecord::Base
  belongs_to :user

  before_save :convert_time

  def convert_time
    string = time
    hour_to_sec = (string[0..1]).to_i * 60 * 60
    min_to_sec = (string[3..4]).to_i * 60
    seconds = (string[6..7]).to_i
    self.duration = hour_to_sec + min_to_sec + seconds
  end
end
