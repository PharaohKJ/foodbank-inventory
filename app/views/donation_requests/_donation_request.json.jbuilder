json.extract! donation_request, :id, :email, :company, :name, :address, :tel, :created_at, :updated_at
json.url donation_request_url(donation_request, format: :json)
