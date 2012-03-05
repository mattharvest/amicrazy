namespace :db do
	desc "Fill database with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		admin = User.create!(:name => "Admin User",
                         :email => "matthew.bohrer@gmail.com",
                         :password => "foobar",
                         :password_confirmation => "foobar")
		admin.toggle!(:admin)
  end
end