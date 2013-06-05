class CreateTaggingprojects < ActiveRecord::Migration
  def change
    create_table :taggingprojects do |t|
      t.belongs_to :tagproject
      t.belongs_to :project

      t.timestamps
    end
    add_index :taggingprojects, :tagproject_id
    add_index :taggingprojects, :project_id
  end
end
