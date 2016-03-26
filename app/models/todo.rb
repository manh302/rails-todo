class Todo < ActiveRecord::Base
	scope :InUse, lambda { where(:is_use=>true)  }
end
