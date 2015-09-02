module LinkedList
  class Node

    @count = 0  # => 0

    attr_accessor :value, :following  # => nil

    def initialize(value, following = nil)
      @value = value
      @following = following
    end                                     # => :initialize

    def tail?
      @following.nil?
    end                # => :tail?


  end  # => :tail?
end    # => :tail?
