require "test_helper"
require "user"

class UserTest < ActiveSupport::TestCase
    def test_initialize_with_attributes
        user = User.new(id: 1, name: "Marc")
        assert_equal 1, user.id
        assert_equal "Marc", user.name
    end

end
