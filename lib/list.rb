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
      end
    #   else
    #     @counter = 1
    #     current_position = @head
    #     until current_position.tail? || position == @counter
    #       @counter += 1
    #       current_position = current_position.following
    #     end
    #   end
    #   @counter
    # end
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




  end
end

@list = LinkedList::List.new()
@node_1 = LinkedList::Node.new(1)
@node_2 = LinkedList::Node.new(2)
@node_3 = LinkedList::Node.new(3)
#
#
@list.append(@node_1)
@list.append(@node_2)
@list.append(@node_3)
#
# @node_1.following
# @list.head.following.value
#
# @list.includes?(2)
@list
@list.count
