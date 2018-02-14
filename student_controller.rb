require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")

require_relative("./models/students.rb")

# index
get "/enrolled-students" do
  @students = Student.all()
  erb(:index)
end