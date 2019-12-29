class AddHeadOfFamilyFlagToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :head_of_family, :boolean, default: false, null: false
  end
end
