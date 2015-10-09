class Parent
    def say
        puts "In Parent"
    end
end

module A
    def say
        puts "In A"
        super
    end
end

module B 
    def say
        puts "In B"
        super
    end
end

# method 1
class Child < Parent
    include A, B
end
#puts Child.ancestors
object = Child.new
object.say

# # method 2 for ruby 2.0
# class Parent
#     prepend A, B
# end
# puts Parent.ancestors
# object = Parent.new
# object.say

