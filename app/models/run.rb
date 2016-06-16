# frozen_string_literal: true
class Run < ActiveRecord::Base
  belongs_to :user

  before_save :convert_duration
  before_save :convert_distance

  attr_writer :duration_attributes
  attr_writer :distance_attributes

  def convert_duration
    self.duration = (@duration_attributes[:hours].to_i * 60 * 60) +
                    (@duration_attributes[:minutes].to_i * 60) +
                    @duration_attributes[:seconds].to_i
  end

  def convert_distance
    self.distance = if @distance_attributes[:unit] == "km"
                      @distance_attributes[:length].to_f * 0.62137
                    elsif @distance_attributes[:unit] == "m"
                      @distance_attributes[:length].to_f * 0.00062137
                    else
                      @distance_attributes[:length].to_f
                    end
  end
end
