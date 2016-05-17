class Client < ActiveRecord::Base
	has_many :projects,dependent: :destroy
	has_one :bank_detail
	accepts_nested_attributes_for :bank_detail
	belongs_to :user

    validates_presence_of :name, :mobile ,:company, :email
    validates_numericality_of :mobile
    validates_length_of :mobile , is: 10
    validates_uniqueness_of :email
    validates_format_of :email, with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	def list_projects
		Project.where('client_id = ?',self.id)
	end
	def open_projects
		Project.where('client_id = ? AND status = ?',self.id,"open")
	end
	def completed_projects
		Project.where('client_id = ? AND status = ?',self.id,"completed")
	end
	def thisyear_projects
		Project.where('client_id = ? AND start_date >= ? AND start_date <= ?',self.id,Date.today.beginning_of_year,Date.today)
	end
	def lastyear_projects
		Project.where('client_id = ? AND start_date >= ? AND start_date <= ?',self.id,)
	end
	def lastclientpro
    	Project.where('client_id = ? AND (status = ? OR status = ?)',self.id,"completed","on-going")
    end
    def lastpro_task
		Project.where('client_id = ?',self.id,)
	end
	
end
