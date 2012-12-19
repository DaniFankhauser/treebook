require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "a user should enter first name" do 
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end
	test "a user should enter last name" do 
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end
	test "a user should enter profile name" do 
		user = User.new
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end
	test "a user should have a unique profile name" do
		user = User.new
		user.profile_name = users(:dani).profile_name


		assert !user.save
		assert !user.errors[:profile_name].empty?
	end 

	test "a user should have a profile name without spaces" do
		user = User.new(first_name: 'Dani', last_name: 'Fankhauser', email: 'daniellerae105@gmail.com')
		user.password = user.password_confirmation = 'garden7'

		user.profile_name = "My Profile With Spaces"
		
		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formmated correctly.")
	end


	test "a user can have a correctly formatted profile name" do
		user = User.new(first_name: 'Dani', last_name: 'Fankhauser', email: 'daniellerae105@gmail.com')
		user.password = user.password_confirmation = 'garden7'

		user.profile_name = 'dani'
		assert user.valid?
	end
  # test "the truth" do
  #   assert true
  # end
end
