# frozen_string_literal: true
class Run < ActiveRecord::Base
  belongs_to :user

  attr_writer :duration_attributes,
              :distance_attributes,
              :temperature_attributes

  validates :occurred_at, presence: true
  validate :existance_of_distance_attributes,
           :existance_of_duration_attributes

  before_save :convert_duration, :convert_distance, :convert_temperature

  def convert_duration
    self.duration = (@duration_attributes[:hours].to_i * 60 * 60) +
                    (@duration_attributes[:minutes].to_i * 60) +
                    @duration_attributes[:seconds].to_i
  end

  def convert_distance
    distance_unit = @distance_attributes[:unit]
    length_as_float = @distance_attributes[:length].to_f

    self.distance = if distance_unit == "km"
                      length_as_float * 0.62137
                    elsif distance_unit == "m"
                      length_as_float * 0.00062137
                    else
                      length_as_float
                    end
  end

  def convert_temperature
    unless @temperature_attributes.nil?
      temp_integer = @temperature_attributes[:value].to_i
      self.temperature = if @temperature_attributes[:unit] == "C"
                           ((temp_integer * 9) / 5) + 32
                         else
                           temp_integer
                         end
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
