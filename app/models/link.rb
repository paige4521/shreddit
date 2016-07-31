class Link < ActiveRecord::Base
  belongs_to :user
  acts_as_votable #this is a method within the acts_as_votable gem.  It makes
  #active record associations on our behalf
end
