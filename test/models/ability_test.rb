# frozen_string_literal: true
require "test_helper"

# ability model test
class AbilityTest < ActiveSupport::TestCase
  test "admin can manage all" do
    user = users(:one)
    ability = Ability.new(user)
    assert ability.can?(:read, :all)
    assert ability.can?(:manage, :all)
  end

  test "non-admin cannot manage all" do
    user = users(:two)
    ability = Ability.new(user)
    assert ability.can?(:read, :all)
    assert_not ability.can?(:manage, :all)
  end
end
