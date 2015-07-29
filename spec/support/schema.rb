ActiveRecord::Schema.define do
  self.verbose = false

  drop_table :users
  
  create_table(:users) do |t|
    t.string :name
    t.json   :office
  end
end
