class CreateDecryptionKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :decryption_keys do |t|
      t.string :safe_number
      t.string :key

      t.timestamps
    end
  end
end
