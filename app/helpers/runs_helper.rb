# frozen_string_literal: true
module RunsHelper
  MIN_IN_HR = 60
  SEC_IN_MIN = 60

  def distance_for(run)
    summed_distance = run.sum(:distance)
    return if summed_distance == 0
    distance = summed_distance.round(2)
    "#{distance} miles"
  end

  def total_duration(run)
    format_time(run.duration)
  end

  def pace(duration:, distance:)
    return if distance == 0
    duration_per_mile = (duration / distance)
    "#{format_time(duration_per_mile)} min/mile"
  end

  def month_runs
    @runs.where(
      occurred_at: now.beginning_of_month..now.end_of_month
    )
  end

  def week_runs
    @runs.where(
      occurred_at: now.beginning_of_week..now.end_of_week
    )
  end

  def hours(time)
    time / (SEC_IN_MIN * MIN_IN_HR)
  end

  def minutes(time)
    (time / SEC_IN_MIN) % MIN_IN_HR
  end

  def seconds(time)
    time % SEC_IN_MIN
  end

  private

  def format_time(duration)
    total_hours = hours(duration)
    total_minutes = minutes(duration)
    total_seconds = seconds(duration)
    if total_hours < 1
      format("%02d:%02d", total_minutes, total_seconds)
    else
      format("%02d:%02d:%02d", total_hours, total_minutes, total_seconds)
    end
  end

  def now
    Time.zone.now
  end
end
