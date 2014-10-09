require 'spec_helper'
require 'helpers/session'

include SessionHelpers

feature "User has forgetten password" do 

	before(:each) do
		User.create(:email => "test@test.com",
								:password => 'test',
								:password_confirmation => 'test')
	end

	scenario "User clicks forgetton password button to go to form" do
		visit '/'
		expect(page).to have_content("Forgotten password?")
		click_button('forgot_password')
		expect(page).to have_content("Enter email address")
	end

	# scenario "User enters email to receive token"
	# 	visit '/forgot_password'
	# 	expect(page).to have_content("Enter email address")
	# 	fill_in 'email', :with => email
	# 	expect
	
end
	
