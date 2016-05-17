json.array!(@bank_details) do |bank_detail|
  json.extract! bank_detail, :id, :client_id, :acc_no, :bank_name, :tin_number
  json.url bank_detail_url(bank_detail, format: :json)
end
