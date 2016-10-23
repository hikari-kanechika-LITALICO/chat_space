class CreateMassages < ActiveRecord::Migration
  def change
    create_table :massages do |t|
      t.text        :text
      t.string      :image
      t.references   :user, foreign_key: true
      t.references   :group, foreign_key: true
      t.timestamps
    end
  end
end
