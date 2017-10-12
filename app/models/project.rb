class Project < ActiveRecord::Base
	belongs_to :user
	belongs_to :category, foreign_key: "cid"
	
	scope :joins_category, -> () {joins('left join categories on categories.id = projects.cid')}
	scope :joins_user, -> () {joins(:user)}

  def self.filter_data(sort_method)
  	self.order(sort_method)
  end

end
