Hanami::Model.migration do
  change do
    create_table :books do
      primary_key :id

      foreign_key :user_id, :users, on_delete: :cascade, null: false

      column :title, String, null: false
      column :author, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
