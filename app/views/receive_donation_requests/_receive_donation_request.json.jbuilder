json.extract! receive_donation_request, :id, :tel, :name, :scheduled_time, :accepted, :created_at, :updated_at
json.url receive_donation_request_url(receive_donation_request, format: :json)
