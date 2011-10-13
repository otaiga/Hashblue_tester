class MainController < ApplicationController
  require 'open-uri'
  require 'json'
  require 'httparty'
  require 'hash-blue'
  
  
  CLIENT_ID = ENV['CLIENT_ID']
  CLIENT_SECRET = ENV['CLIENT_SECRET']
  MSISDN = ENV['MY_MSISDN']
  
  AUTH_SERVER = "https://hashblue.com"
  API_SERVER = "https://api.hashblue.com"
  
  
  def index
  end

  def main
    puts CLIENT_ID
    puts CLIENT_SECRET
  end


  def callback
        # assuming access is granted
        # Call server to get an access token
        
        response = HTTParty.post(AUTH_SERVER + "/oauth/access_token", :body => {
          :client_id => CLIENT_ID,
          :client_secret => CLIENT_SECRET,
          :redirect_uri => "http://" + request.host_with_port + "/callback",
          :code => params["code"],
          :grant_type => 'authorization_code'}
        )
      
        session[:access_token] = response["access_token"]
        $access_token = response["access_token"]
        HashBlue::Client.user = $access_token
        
         redirect_to '/run'   
  end
  
  
  def auth
     #   if session[:access_token]
     #       # (authorized so request the messages from #blue)
     #            redirect_to '/run'     
     #    
     # else
     
     # No Access token therefore authorize this application and request an access token
     redirect_to "https://hashblue.com/oauth/authorize?client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}&redirect_uri=http://" + request.host_with_port + "/callback"
     puts "ERROR TOKEN #{CLIENT_SECRET}"
       # end
  end

  def run
    
    @message = "Test messge"
     HashBlue::Message.create!(MSISDN, @message)
     puts "message sent"
      
  end

end
