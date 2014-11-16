ThinkingSphinx::Index.define :patient, :with => :active_record do
  # fields
  indexes [first_name, last_name]
  indexes card_no
  
  # attributes
  has :created_at
  has :updated_at
end
