# frozen_string_literal: true

# presenter used for Users views
class UsersPresenter < SimpleDelegator
  def self.from(users)
    users.map { |user| new(user) }
  end

  def pretty_birth_date
    return unless birth_date
    birth_date.strftime("%B %d, %Y")
  end

  def pretty_height
    return unless height
    "#{(height / 12).floor}' #{height % 12}\""
  end

  def pretty_weight
    "#{weight} lb"
  end
end
