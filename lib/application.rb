require "action_controller"
require "application_controller"
require "active_record"
require "router"
require "config/routes"

class Object
    def  const_missing(name)
        #name # :user => "user"
        require name.to_s.downcase
    end
end

class Application
    def call(env)
        request = Rack::Request.new(env)
        response = Rack::Response.new

        controller_name, action_name = route(request.path_info) #/home/inedex

        controller_class = load_controller_class(controller_name) #HomeController
        controller = controller_class.new #HomeController.new
        controller.request = request
        controller.response = response
        controller.process(action_name) # calls: controller.index
        # response.write "hi hi from Application"
        response.finish
        #[200, {}, ["hi from Application"]]
    end

    def route(path)
        # _, controller_name, action_name = path.split("/") # => "/home/index" => ["", "home", "index"]
        # [controller_name || "home", action_name || "index"]
        Routes.recognize(path)
    end

    def load_controller_class(name)
        # name = "home" => HomeComtroller
        require "#{name}_controller" # require "home_controller"
        Object.const_get name.capitalize + "Controller"
    end
end
