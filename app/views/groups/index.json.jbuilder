json.array!(@groups) do |group|
  json.extract! group, :group_name, :group_detail
  json.url group_url(group, format: :json)
end