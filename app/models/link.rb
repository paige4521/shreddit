class Link < ActiveRecord::Base

  acts_as_votable #this is a method within the acts_as_votable gem.  It makes
  #active record associations on our behalf
  belongs_to :user
  has_many :comments

end
