require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

before do
  @users = YAML.load_file('data/users.yaml')
end

get "/" do
  @title = "Users and Interests"
  erb :home
end

get "/:user" do
  @user = params[:user].to_sym
  @title = @user.to_s.capitalize

  erb :user
end

helpers do
  def count_interests(users)
    count = 0
    users.each { |_, value| count += value[:interests].size }
    count
  end
end
