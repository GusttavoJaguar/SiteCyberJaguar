class CreateContacts < ActiveRecord::Migration[8.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :subject
      t.string :service_type
      t.text :message

      t.timestamps
    end
  end
end
