require 'active_support/concern'
require 'active_support/callbacks'

module Filtering
    extend ActiveSupport::Concern
    # def self.included(base) # base == ActionController
    #     base.extend ClassMethods
    # end
    include ActiveSupport::Callbacks

    included do
        define_callbacks :process
    end

    module ClassMethods
      def before_action(method)
          #before_actions << method
          set_callback :process, :before, method
      end

      # def before_actions
      #     @before_actions ||= []
      # end

      def after_action(method)
          #after_actions << method
          set_callback :process, :after, method
      end

      # def after_actions
      #     @after_actions ||= []
      # end

    end

    def process(action_name)
        # puts "process on filtering"
        # self.class.before_actions.each {|method| send method}
        # super
        # self.class.after_actions.each {|method| send method}
        run_callbacks :process do
            super
        end
    end
        
end
