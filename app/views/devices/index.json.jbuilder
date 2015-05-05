json.array!(@devices) do |device|
  json.extract! device, :id, :name, :owner
  json.url device_url(device, format: :json)
end
