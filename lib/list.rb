require_relative 'node'  # => true

module LinkedList
  class List

    attr_accessor :head  # => nil

    def initialize(head = nil)
      @head = head              # => nil
    end                         # => :initialize

    def append(node)
      if @head.nil?                                      # => true, false
        @head = node                                     # => #<LinkedList::Node:0x007f8f198c0b90 @value=1, @following=nil>
      else
        current_position = @head                         # => #<LinkedList::Node:0x007f8f198c0b90 @value=1, @following=nil>
        until node.tail?                                 # => true
          current_position = current_position.following
        end                                              # => nil

        current_position.following = node  # => #<LinkedList::Node:0x007f8f198c08e8 @value=2, @following=nil>
      end                                  # => #<LinkedList::Node:0x007f8f198c0b90 @value=1, @following=nil>, #<LinkedList::Node:0x007f8f198c08e8 @value=2, @following=nil>
    end                                    # => :append


  end  # => :append
end    # => :append

@list = LinkedList::List.new()     # => #<LinkedList::List:0x007f8f198c0fc8 @head=nil>
@node_1 = LinkedList::Node.new(1)  # => #<LinkedList::Node:0x007f8f198c0b90 @value=1, @following=nil>
@node_2 = LinkedList::Node.new(2)  # => #<LinkedList::Node:0x007f8f198c08e8 @value=2, @following=nil>


@list.append(@node_1)  # => #<LinkedList::Node:0x007f8f198c0b90 @value=1, @following=nil>
@list.append(@node_2)  # => #<LinkedList::Node:0x007f8f198c08e8 @value=2, @following=nil>
