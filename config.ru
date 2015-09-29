# Start with: shotgun
# Under Windows: rackup  (CTRL+C and restart on each change)

# class App
#   def call(env)
#     # Return the response array here
#       [
#         200,
#         { "Content-Type" => "text/plain"},
#         [env['PATH_INFO']]
#       ]
#   end
#
# end
#
# run App.new

# my_proc = -> env do
#     [200, {}, ['hi']]
# end
#
# run my_proc


Routes = {
  "GET" => {
  }
}

def get(path, &block)
    Routes["GET"][path] = block
end

get "/" do
    "awesome!"
end

get "/hello" do
    "hello awesome!"
end

run -> env do
  method = env["REQUEST_METHOD"]
  path = env["PATH_INFO"]
  if block = Routes[method][path]
      body = block.call
      [200, {}, [body]]
  else
      [404, {}, ["Not found"]]
  end
end
