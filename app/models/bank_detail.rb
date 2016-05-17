class BankDetail < ActiveRecord::Base
	belongs_to :client
	validates_presence_of :acc_no
end
