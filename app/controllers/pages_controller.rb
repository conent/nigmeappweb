class PagesController < ApplicationController
	protect_from_forgery with: :null_session
	respond_to :html
  
  def welcome
  end
  
  def home  	
  end
  
  def test
  	
  	@string = "not set"
  	if params != nil
	      require 'gcm'

				gcm = GCM.new("AIzaSyD2DDS4y3TVNGHIvUwNDf65BpW5lEXFjpg")
				# you can set option parameters in here
				#  - all options are pass to HTTParty method arguments
				#  - ref: https://github.com/jnunemaker/httparty/blob/master/lib/httparty.rb#L40-L68
				#  gcm = GCM.new("my_api_key", timeout: 3)

				registration_ids= ["12", "13"] # an array of one or more client registration IDs
				options = {data: {score: "123"}, collapse_key: "updated_score"}
				response = gcm.send(registration_ids, options)


	      @string = "Recived"
	      render :json =>{:data => @string}
    end
   end

end
