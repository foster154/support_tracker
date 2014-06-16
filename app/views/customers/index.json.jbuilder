json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :cust_id, :address, :city, :state, :zip
  json.url customer_url(customer, format: :json)
end
