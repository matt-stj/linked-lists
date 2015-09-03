module LinkedList
  class Node
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
