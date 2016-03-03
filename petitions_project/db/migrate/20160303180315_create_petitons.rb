class CreatePetitons < ActiveRecord::Migration
  def change
    create_table :petitons do |t|

      t.timestamps null: false
    end
  end
end
