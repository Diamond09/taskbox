class Task < ActiveRecord::Base
	belongs_to :project
	belongs_to :user
	validates :name, presence: true

	validate :check_due_date

	private 
	def check_due_date
		if !self.due_date.nil? && self.due_date < self.project.start_date
			errors.add(:due_date,"is invalid.Cannot be less than #{self.project.start_date}")
		end
	end	


end
