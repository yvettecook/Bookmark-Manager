class Mailer

	def self.create_token
		(1..64).map{('A'..'Z').to_a.sample}.join
	end

	def self.create_time_stamp
		Time.now
	end

	def self.send_reset_email(user)
	  RestClient.post "https://api:key-2c201a3ec124da183d50183c15d2b01b"\
	  "@api.mailgun.net/v2/sandboxf658f39bef734ff2afdac292422ad96b.mailgun.org/messages",
	  :from => "Mailgun Sandbox <postmaster@sandboxf658f39bef734ff2afdac292422ad96b.mailgun.org>",
	  :to => user.email,
	  :subject => "Hello Yvette",
	  :text => "Reset password link: http://localhost:9292/users/reset_password/#{user.password_token}"
	end


end
