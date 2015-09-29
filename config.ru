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

run -> env do
  [200, {}, ['hi']]
end
