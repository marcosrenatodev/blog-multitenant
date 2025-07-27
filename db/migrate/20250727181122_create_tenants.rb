class CreateTenants < ActiveRecord::Migration[7.1]
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :domain
      t.string :site_title
      t.text :default_description
      t.string :theme

      t.timestamps
    end
    add_index :tenants, :domain, unique: true
  end
end
