json.array!(@bs_or_pl_categories) do |bs_or_pl_category|
  json.extract! bs_or_pl_category, :id, :name, :bl_or_pl
  json.url bs_or_pl_category_url(bs_or_pl_category, format: :json)
end
