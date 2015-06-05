class MobilecontrollerController < ApplicationController
	require 'net/http'
	skip_before_filter :verify_authenticity_token, :only => [:login]
	skip_after_filter :verify_authenticity_token, :only => [:login]

	def login  	
		@email = params[:email]
		@password = params[:pwd]
		uri = URI('http://www.example.com/search.cgi')
		res = Net::HTTP.post_form(uri, 'email' => @email, 'password' => @password)
		puts res.body
  end

end
