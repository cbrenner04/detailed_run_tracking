# frozen_string_literal: true
class Run < ActiveRecord::Base
  belongs_to :user

  before_save :convert_duration

  attr_writer :duration_attributes

  def convert_duration
    self.duration = (@duration_attributes[:hours].to_i * 60 * 60) +
                    (@duration_attributes[:minutes].to_i * 60) +
                    @duration_attributes[:seconds].to_i
  end
end
