class RemoveTweetAndAritsitFromPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :tweet, :string
    remove_column :posts, :aritsit, :string
  end
end
