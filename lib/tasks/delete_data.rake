desc "Warning: Be cautious while running this file. Will remove all data"
task :delete_data => :environment do
Client.delete_all
Project.delete_all
Task.delete_all
User.delete_all
Profile.delete_all
end