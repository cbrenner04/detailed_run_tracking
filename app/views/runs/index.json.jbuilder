# frozen_string_literal: true
json.array!(@runs) do |run|
  json.extract! run, :id, :occurred_at, :distance, :duration
  json.url run_url(run, format: :json)
end
