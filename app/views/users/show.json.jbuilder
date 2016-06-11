# frozen_string_literal: true
json.extract! @user, :id, :email, :password, :first_name, :last_name,
              :birth_date, :height, :weight, :created_at, :updated_at
