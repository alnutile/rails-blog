class RenameArticleIdToPostId < ActiveRecord::Migration
  def up
  	#rename_column :taggings, :article_id, :post_id
  end

  def down
  	#raise ActiveRecord::IrreversibleMigration
  end
end
