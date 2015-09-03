require_relative 'node'

module LinkedList
  class List

    attr_accessor :head

    def initialize(head = nil)
      @head = head
    end

    def stepper
    end

    def append(node)
      if @head.nil?
        @head = node
      else
        current_position = @head
        until current_position.tail?
          current_position = current_position.following
        end
        current_position.following = node
      end
    end

    def prepend(node)
      if @head.nil?
        @head = node
      else
        node.following = @head
        @head = node
      end
    end

    def insert(node, location)
      @counter = 0
      if @head.nil? && location == 0
        @head = node
      elsif location == 0
        node.following = @head
        @head = node
      else
        current_position = @head
        until current_position.tail? || location == @counter
          @counter += 1
          current_position = current_position.following
        end
        node.following = current_position.following
        current_position.following = node
      end
    end

    def includes?(value)
      if @head.nil?
        return false
      else
      current_position = @head
        until current_position.tail?
          if current_position.value == value
            return true
          else
            current_position = current_position.following
          end
        end
      return false
      end
    end


    def pop
      if @head.nil?
        return "Can't pop an empty list"
      elsif @head.following == nil
          @head = nil
      else
        current_position = @head
        until current_position.following.tail?
          current_position = current_position.following
        end
        current_position.following = nil
      end
    end

    def count
      if @head.nil?
        return "The list is empty"
      else
        @counter = 1
        current_position = @head
        until current_position.tail?
          @counter += 1
          current_position = current_position.following
        end
      end
      @counter
    end

    def head_value
      if @head.nil?
        return "The list is empty"
      else
        @head.value
      end
    end

    def tail_value
      if @head.nil?
        return "There is no tail - the list is empty."
      else
        current_position = @head
        until current_position.tail?
          current_position = current_position.following
        end
        current_position.value
      end
    end

    def find_by_index(location)
      @counter = 0
      if @head.nil? && location == 0
        return "The list is empty"
      elsif location == 0
        @head.value
      else
        current_position = @head
        until current_position.tail? || location == @counter
          @counter += 1
          current_position = current_position.following
        end
        current_position.value 
      end
    end

  end
end

@list = LinkedList::List.new()
@node_1 = LinkedList::Node.new(1)
@node_2 = LinkedList::Node.new(2)
@node_3 = LinkedList::Node.new(3)
@node_4 = LinkedList::Node.new(4)
#
#
@list.append(@node_1)
@list.append(@node_2)
@list.append(@node_3)
@list.count
#
# @node_1.following
# @list.head.following.value
#
# @list.includes?(2)
# @list                     # => #<LinkedList::List:0x007fa9a983a3d8 @head=#<LinkedList::Node:0x007fa9a983a018 @value=1, @following=#<LinkedList::Node:0x007fa9a9839de8 @value=2, @following=#<LinkedList::Node:0x007fa9a9839bb8 @value=3, @following=nil>>>>
# @list.count               # => 3
@list.insert(@node_4, 2)
@list
@list.count
@list.find_by_index(1)
