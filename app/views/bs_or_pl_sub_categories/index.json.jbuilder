json.array!(@bs_or_pl_sub_categories) do |bs_or_pl_sub_category|
  json.extract! bs_or_pl_sub_category, :id, :name, :bs_or_pl_category_id
  json.url bs_or_pl_sub_category_url(bs_or_pl_sub_category, format: :json)
end
