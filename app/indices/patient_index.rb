ThinkingSphinx::Index.define :patient, :with => :active_record do
  # fields
  indexes first_name, :sortable => true
  indexes last_name, :sortable => true
  indexes card_no
  
  # attributes
  has id, created_at, updated_at
end
