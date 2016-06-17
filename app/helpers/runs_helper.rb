# frozen_string_literal: true
module RunsHelper
  def distance_for(run)
    unless run.sum(:distance) == 0
      distance = run.sum(:distance).round(2)
      "#{distance} miles"
    end
  end

  def total_duration(run)
    format_time(run.duration)
  end

  def pace(duration:, distance:)
    unless distance == 0
      duration_per_mile = (duration / distance)
      "#{format_time(duration_per_mile)} min/mile"
    end
  end

  def month_runs
    @runs.where(
      occurred_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month
    )
  end

  def week_runs
    @runs.where(
      occurred_at: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week
    )
  end

  def hours(time)
    time.nil? ? 0 : time / (60 * 60)
  end

  def minutes(time)
    time.nil? ? 0 : (time / 60) % 60
  end

  def seconds(time)
    time.nil? ? 0 : time % 60
  end

  private

  def format_time(duration)
    if hours(duration) < 1
      format("%02d:%02d", minutes(duration), seconds(duration))
    else
      format("%02d:%02d:%02d", hours(duration), minutes(duration),
             seconds(duration))
    end
  end
end
