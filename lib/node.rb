module LinkedList
  class Node

    @count = 0

    attr_accessor :value, :following

    def initialize(value, following = nil)
      @value = value
      @following = following
    end

    def tail?
      @following.nil?
    end


  end
end

LinkedList::Node.new("hi").tail?
