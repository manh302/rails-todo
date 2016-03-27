class Todo < ActiveRecord::Base
	scope :incomplete_task, lambda { where(:is_use=>true)  }
	scope :complete_task, lambda { where(:is_use=>false)  }
end
