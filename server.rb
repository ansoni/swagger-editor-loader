require 'rubygems'
require 'sinatra'

set :bind, "0.0.0.0"
set :port, 8080
set :public_folder, File.dirname(__FILE__) 

get "/" do 
  redirect "/index.html", 303
end

put "/data/swagger.yaml" do
  File.open("data/swagger.yaml", 'w') { |file|
    file.write(request.body.read)
  }
  "saved"
end
