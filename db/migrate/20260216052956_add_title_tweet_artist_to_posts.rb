class AddTitleTweetArtistToPosts < ActiveRecord::Migration[7.0]
  def change
    #add_column :posts, :title, :text   #  
    add_column :posts, :tweet, :text  
    add_column :posts, :aritsit, :text
  end
end
