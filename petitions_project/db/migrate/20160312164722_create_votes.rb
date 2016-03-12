class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :petition_id
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
