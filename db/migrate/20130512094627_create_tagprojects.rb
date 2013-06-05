class CreateTagprojects < ActiveRecord::Migration
  def change
    create_table :tagprojects do |t|
      t.string :name

      t.timestamps
    end
  end
end
