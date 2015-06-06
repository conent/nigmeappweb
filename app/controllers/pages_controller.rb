class PagesController < ApplicationController
	protect_from_forgery with: :null_session
	skip_before_filter :verify_authenticity_token, :only => [:test]
	respond_to :html
  
  def welcome
  end
  
  def home  	
  end
  
  def test
  	
  	@string = "not set"
  	if params != nil

        @device = Device.new

  			@device.name = params[:deviceName]
  			@device.regID = params[:deviceID]

  			if @device.save
          @string = "device saved"
    				# do something when save is successful
  			else
          @string= "error"
    				# handle the case when it doesn't save properly
  			end


	      @string = params[:deviceID] 
        #provare a commentare la linea sotto
	      render :json =>{:data => @string, :data2 => params[:deviceID]}
	      #puts response {render :layout => false}
    end
   end

   def testsend
    @deviceID = 0
    @message = "my message"
    if params != nil
        @deviceID = params[:deviceID]
        @message = params[:urlImage]

        require 'gcm'

        gcm = GCM.new("AIzaSyD2DDS4y3TVNGHIvUwNDf65BpW5lEXFjpg")
        # you can set option parameters in here
        #  - all options are pass to HTTParty method arguments
        #  - ref: https://github.com/jnunemaker/httparty/blob/master/lib/httparty.rb#L40-L68
        #  gcm = GCM.new("my_api_key", timeout: 3)
        puts "TRYING TO RESPOND, logs!"
        registration_ids= [@deviceID] # an array of one or more client registration IDs
        options = {data: @message}
        response = gcm.send(registration_ids, options)
        puts "GCM SEND RESPONSE, logs!"

        #provare a commentare la linea sotto
        #render :json =>{:data => @string}
        puts response {render :layout => false}
    end
   end

end
