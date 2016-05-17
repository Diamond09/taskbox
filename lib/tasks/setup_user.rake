desc "setup initial users and roles"
task :setup_user => :environment  do
	Role.create(name: "super_admin")
	Role.create(name: "admin")
	Role.create(name: "user")
	Role.create(name: "client")
	User.create(email: "adithyamp41@gmail.com",password: "9141505900")
	Permission.create(user_id: User.find_by_email("adithyamp41@gmail.com").id, role_id: Role.first.id)
	
  users = User.where('email != ?',"adithyamp41@gmail.com")
  for user in users
  	user.roles << Role.find_by_name("user")
  end
end 