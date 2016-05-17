class Project < ActiveRecord::Base
	belongs_to :client
	belongs_to :user
	has_many :tasks
	has_many :project_categories
	has_many :categories, through: :project_categories
	validates_presence_of :name, :status
	def projectdec_ongoing
		Project.where('client_id = ? AND start_date = ? AND status = ?',self.id,Date.parse("2015-12-01"),"on-going")
    end
    def firstclient
    	Project.where('client_id = ? AND status = ?',1,"open")
    end
    
end
