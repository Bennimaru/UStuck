class AddCommentableToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :commentable, :boolean, default: true
  end
end
