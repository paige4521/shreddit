class AddUserToLinks < ActiveRecord::Migration
  def change
    #This step can also be achieved via terminal with rails g migrate
    #add_column :links, :user_id , :integer.  Chose to do it this way
    #so we can see the migration
    add_column :links, :user_id , :integer

  end
end
