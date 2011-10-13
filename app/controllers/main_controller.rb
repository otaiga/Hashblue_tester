class MainController < ApplicationController
  require 'open-uri'
  require 'json'
  require 'httparty'
  require 'hash-blue'
  
  
  CLIENT_ID = ENV['CLIENT_ID']
  CLIENT_SECRET = ENV['CLIENT_SECRET']
  MSISDN = ENV['MY_MSISDN']
  TOKEN = ENV['CLIENT_TOKEN']
  
  AUTH_SERVER = "https://hashblue.com"
  API_SERVER = "https://api.hashblue.com"
  
  
  def index
  end

  def main
    puts CLIENT_ID
    puts CLIENT_SECRET
  end


  def tr94dmkfrp32cmorew4432d 
    
    HashBlue::Client.user = TOKEN
    @message = "Test messge"
     HashBlue::Message.create!(MSISDN, @message)
     puts "message sent"
      
  end

end
