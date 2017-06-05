# frozen_string_literal: true
require "test_helper"

# run helper test
class RunHelperTest < ActiveSupport::TestCase
  include RunsHelper

  test "should sum distance" do
    runs = users(:one).runs
    assert_equal "3.0 miles", distance_for(runs)
  end

  test "should calculate pace" do
    runs = users(:one).runs
    assert_equal "06:13 min/mile",
                 pace(
                   duration: runs.sum(:duration),
                   distance: runs.sum(:distance)
                 )
  end

  test "should format duration" do
    assert_equal "01:33:22", total_duration(runs(:three))
  end

  test "should return correct number of hours (less than 1)" do
    assert_equal 0, hours(2500)
  end

  test "should return correct number of hours (more than 1)" do
    assert_equal 1, hours(4000)
  end

  test "should return correct number of minutes (less than 1)" do
    assert_equal 0, minutes(30)
  end

  test "should return correct number of minutes (more than 1)" do
    assert_equal 1, minutes(65)
  end

  test "should return correct number of seconds (less than 1)" do
    assert_equal 0, seconds(0)
  end

  test "should return correct number of seconds (more than 1)" do
    assert_equal 1, seconds(1)
  end

  test "should return correct runs this month" do
    @runs = users(:two).runs
    assert_equal [runs(:four), runs(:five)], month_runs
  end

  test "should return correct runs this week" do
    @runs = users(:two).runs
    assert_equal [runs(:five)], week_runs
  end
end
