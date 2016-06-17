# frozen_string_literal: true
class Run < ActiveRecord::Base
  belongs_to :user

  attr_writer :duration_attributes, :distance_attributes

  validates :occurred_at, presence: true
  validate :existance_of_distance_attributes, :existance_of_duration_attributes

  before_save :convert_duration, :convert_distance

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

  private

  def existance_of_distance_attributes
    return unless @distance_attributes.nil?
    errors.add(:distance_attributes, "distance must have a value")
  end

  def existance_of_duration_attributes
    return unless @duration_attributes.nil?
    errors.add(:duration_attributes, "duration must have a value")
  end
end
