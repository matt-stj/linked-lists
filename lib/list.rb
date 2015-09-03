require_relative 'node'

module LinkedList
  class List
    attr_accessor :head

    def initialize(head = nil)
      @head = head
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
        insert_between(node, location)
      end
    end

    def insert_between(node, location)
      current_position = @head
      until current_position.tail? || location == @counter
        @counter += 1
        current_position = current_position.following
      end
      node.following = current_position.following
      current_position.following = node
    end

    def includes?(value)
      if @head.nil?
        return false
      else
        includes_stepper(value)
      end
    end

    def includes_stepper(value)
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

    def pop
      if @head.nil?
        return "Can't pop an empty list"
      elsif @head.following.nil?
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
        return 'The list is empty'
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
        return 'The list is empty'
      else
        @head.value
      end
    end

    def tail_value
      if @head.nil?
        return 'There is no tail - the list is empty.'
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
        return 'The list is empty'
      elsif location == 0
        @head.value
      else
        find_by_index_helper(location)
      end
    end

    def find_by_index_helper(location)
      current_position = @head
      until current_position.tail? || location == @counter
        @counter += 1
        current_position = current_position.following
      end
      if current_position.tail? && location != @counter
        return "location doesn't exist"
      else
        current_position.value
      end
    end

    def find_by_value(value)
      @counter = 0
      if @head.nil?
        return 'The list is empty'
      else
        find_by_value_stepper(value)
      end
    end

    def find_by_value_stepper(value)
      current_position = @head
      until current_position.tail? || value == current_position.value
        @counter += 1
        current_position = current_position.following
      end
      if current_position.tail? && current_position.value != value
        return "value doesn't exist"
      else
        return @counter
      end
    end

    def remove_by_index(location)
      if @head.nil? && location == 0
        return 'The list is empty'
      elsif location == 0
        @head = @head.following
      else
        remove_by_index_stepper(location)
      end
    end

    def remove_by_index_stepper(location)
      previous_position = @head
      current_position = @head.following
      @counter = 0
      location -= 1
      until current_position.tail? || location == @counter
        previous_position = previous_position.following
        current_position = current_position.following
        @counter += 1
      end
      if current_position.tail? && location != @counter
        return "location doesn't exist"
      else
        previous_position.following = current_position.following
        current_position.following = nil
      end
    end

    def remove_by_value(value)
      if @head.nil?
        return "The list is empty"
      elsif @head.value == value
        @head = @head.following
      else
        remove_by_value_logic(value)
      end
    end

    def remove_by_value_logic(value)
      previous_position = @head
      current_position = @head.following
      @counter = 0
      until current_position.tail? || current_position.value == value
        previous_position = previous_position.following
        current_position = current_position.following
        @counter += 1
      end
      if current_position.tail? && current_position.value != value
        return "value doesn't exist"
      else
        previous_position.following = current_position.following
        current_position.following = nil
      end
    end

    def find_distance(node_1, node_2)
      @counter_1 = 0
      @counter_2 = 0
      if @head.nil?
        return 'The list is empty'
      else
        find_distance_stepper(node_1, node_2)
      end
    end

    def find_distance_stepper(node_1, node_2)
      current_position = @head
      until current_position.tail? || node_1 == current_position
        @counter_1 += 1
        current_position = current_position.following
      end
      until current_position.tail? || node_2 == current_position
        @counter_2 += 1
        current_position = current_position.following
      end
      @counter_2 - @counter_1
    end

  end
end
