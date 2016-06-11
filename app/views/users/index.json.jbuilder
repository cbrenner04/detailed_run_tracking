# frozen_string_literal: true
json.array!(@users) do |user|
  json.extract! user, :id, :email, :password, :first_name, :last_name,
                :birth_date, :height, :weight
  json.url user_url(user, format: :json)
end
