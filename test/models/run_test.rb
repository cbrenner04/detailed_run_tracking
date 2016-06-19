# frozen_string_literal: true
require "test_helper"

# run model test
class RunTest < ActiveSupport::TestCase
  test "should not save Run without occurred_at" do
    run = Run.new(
      distance_attributes: { unit: "mi", length: 1 },
      duration_attributes: { hours: 1, minutes: 1, seconds: 1 }
    )
    assert_not run.save, "Saved the run without occurred_at"
  end

  test "should not save Run without distance" do
    run = Run.new(
      occurred_at: Time.zone.now,
      duration_attributes: { hours: 1, minutes: 1, seconds: 1 }
    )
    assert_not run.save, "Saved the run without distance"
  end

  test "should not save Run without duration" do
    run = Run.new(
      occurred_at: Time.zone.now,
      distance_attributes: { unit: "mi", length: 1 }
    )
    assert_not run.save, "Saved the run without duration"
  end

  test "should convert distance with km" do
    run = Run.new(
      occurred_at: Time.zone.now,
      distance_attributes: { unit: "km", length: 1 },
      duration_attributes: { hours: 1, minutes: 1, seconds: 1 }
    )
    run.save
    assert (run.distance == 0.62137), "Distance not converted"
  end

  test "should convert distance with m" do
    run = Run.new(
      occurred_at: Time.zone.now,
      distance_attributes: { unit: "m", length: 1 },
      duration_attributes: { hours: 1, minutes: 1, seconds: 1 }
    )
    run.save
    assert (run.distance == 0.00062137), "Distance not converted"
  end

  test "should convert time" do
    run = Run.new(
      occurred_at: Time.zone.now,
      distance_attributes: { unit: "mi", length: 1 },
      duration_attributes: { hours: 1, minutes: 1, seconds: 1 }
    )
    run.save
    assert (run.duration == 3661), "Duration not converted"
  end

  test "should convert temperature from Celsius" do
    run = Run.new(
      occurred_at: Time.zone.now,
      distance_attributes: { unit: "mi", length: 1 },
      duration_attributes: { hours: 1, minutes: 1, seconds: 1 },
      temperature_attributes: { value: 0, unit: "C" }
    )
    run.save
    assert (run.temperature == 32), "Temperature not converted"
  end

  test "should not convert temperature from Fahrenheit" do
    run = Run.new(
      occurred_at: Time.zone.now,
      distance_attributes: { unit: "mi", length: 1 },
      duration_attributes: { hours: 1, minutes: 1, seconds: 1 },
      temperature_attributes: { value: 0, unit: "F" }
    )
    run.save
    assert (run.temperature == 0), "Temperature converted"
  end
end
