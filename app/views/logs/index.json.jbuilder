json.array!(@logs) do |log|
  json.extract! log, :id, :case_type, :person, :customer_id, :description, :length, :followup, :followup_note, :user_id, :app_note
  json.url log_url(log, format: :json)
end
