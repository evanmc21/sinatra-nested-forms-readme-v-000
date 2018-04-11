require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
  erb :new
end

post '/student' do
  @student = Student.new(params[:student])
    #create a new student using the info stored in params[:student]
  params[:student][:courses].each do |details| #an array containing a series of hashes that each store individual course information.
    Course.new(details)
  end
  #iterate over params[:student][:courses]
  @courses = Course.all

  erb :student
end

end
