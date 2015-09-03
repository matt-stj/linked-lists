require_relative 'node'  # => true

module LinkedList
  class List
    attr_accessor :head  # => nil

    def initialize(head = nil)
      @head = head              # => nil
    end                         # => :initialize

    def append(node)
      if @head.nil?                                      # => true, false, false, false
        @head = node                                     # => #<LinkedList::Node:0x007fdd3b87aa30 @value=1, @following=nil>
      else
        current_position = @head                         # => #<LinkedList::Node:0x007fdd3b87aa30 @value=1, @following=nil>, #<LinkedList::Node:0x007fdd3b87aa30 @value=1, @following=#<LinkedList::Node:0x007fdd3b87a760 @value=2, @following=nil>>, #<LinkedList::Node:0x007fdd3b87aa30 @value=1, @following=#<LinkedList::Node:0x007fdd3b87a760 @value=2, @following=#<LinkedList::Node:0x007fdd3b87a490 @value=3, @following=nil>>>
        until current_position.tail?                     # => true, false, true, false, false, true
          current_position = current_position.following  # => #<LinkedList::Node:0x007fdd3b87a760 @value=2, @following=nil>, #<LinkedList::Node:0x007fdd3b87a760 @value=2, @following=#<LinkedList::Node:0x007fdd3b87a490 @value=3, @following=nil>>, #<LinkedList::Node:0x007fdd3b87a490 @value=3, @following=nil>
        end                                              # => nil, nil, nil
        current_position.following = node                # => #<LinkedList::Node:0x007fdd3b87a760 @value=2, @following=nil>, #<LinkedList::Node:0x007fdd3b87a490 @value=3, @following=nil>, #<LinkedList::Node:0x007fdd3b87a1c0 @value=4, @following=nil>
      end                                                # => #<LinkedList::Node:0x007fdd3b87aa30 @value=1, @following=nil>, #<LinkedList::Node:0x007fdd3b87a760 @value=2, @following=nil>, #<LinkedList::Node:0x007fdd3b87a490 @value=3, @following=nil>, #<LinkedList::Node:0x007fdd3b87a1c0 @value=4, @following=nil>
    end                                                  # => :append

    def prepend(node)
      if @head.nil?
        @head = node
      else
        node.following = @head
        @head = node
      end
    end                         # => :prepend

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
    end                                 # => :insert

    def insert_between(node, location)
      current_position = @head
      until current_position.tail? || location == @counter
        @counter += 1
        current_position = current_position.following
      end
      node.following = current_position.following
      current_position.following = node
    end                                                     # => :insert_between

    def includes?(value)
      if @head.nil?
        return false
      else
        includes_stepper(value)
      end
    end                          # => :includes?

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
    end                                                  # => :includes_stepper

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
    end                                                  # => :pop

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
    end                                                  # => :count

    def head_value
      if @head.nil?
        return 'The list is empty'
      else
        @head.value
      end
    end                             # => :head_value

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
    end                                                  # => :tail_value

    def find_by_index(location)
      @counter = 0
      if @head.nil? && location == 0
        return 'The list is empty'
      elsif location == 0
        @head.value
      else
        find_by_index_helper(location)
      end
    end                                 # => :find_by_index

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
    end                                                     # => :find_by_index_helper

    def find_by_value(value)
      @counter = 0
      if @head.nil?
        return 'The list is empty'
      else
        find_by_value_stepper(value)
      end
    end                               # => :find_by_value

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
    end                                                                # => :find_by_value_stepper

    def remove_by_index(location)
      if @head.nil? && location == 0
        return 'The list is empty'
      elsif location == 0
        @head = @head.following
      else
        remove_by_index_stepper(location)
      end
    end                                    # => :remove_by_index

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
    end                                                           # => :remove_by_index_stepper

    def remove_by_value(value)
      if @head.nil?
        return "The list is empty"
      elsif @head.value == value
        @head = @head.following
      else
        remove_by_value_logic(value)
      end
    end                               # => :remove_by_value

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
    end                                                                # => :remove_by_value_logic

    def find_distance(node_1, node_2)
      @counter_1 = 0                           # => 0
      @counter_2 = 0                           # => 0
      if @head.nil?                            # => false
        return 'The list is empty'
      else
        find_distance_stepper(node_1, node_2)  # => 2
      end
    end                                        # => :find_distance

    def find_distance_stepper(node_1, node_2)
      current_position = @head                                    # => #<LinkedList::Node:0x007fdd3b87aa30 @value=1, @following=#<LinkedList::Node:0x007fdd3b87a760 @value=2, @following=#<LinkedList::Node:0x007fdd3b87a490 @value=3, @following=#<LinkedList::Node:0x007fdd3b87a1c0 @value=4, @following=nil>>>>
      until current_position.tail? || node_1 == current_position  # => true
        current_position
        @counter_1 += 1
        current_position = current_position.following
      end                                                         # => nil

      until current_position.tail? || node_2 == current_position  # => false, false, true
        current_position                                          # => #<LinkedList::Node:0x007fdd3b87aa30 @value=1, @following=#<LinkedList::Node:0x007fdd3b87a760 @value=2, @following=#<LinkedList::Node:0x007fdd3b87a490 @value=3, @following=#<LinkedList::Node:0x007fdd3b87a1c0 @value=4, @following=nil>>>>, #<LinkedList::Node:0x007fdd3b87a760 @value=2, @following=#<LinkedList::Node:0x007fdd3b87a490 @value=3, @following=#<LinkedList::Node:0x007fdd3b87a1c0 @value=4, @following=nil>>>
        @counter_2 += 1                                           # => 1, 2
        current_position = current_position.following             # => #<LinkedList::Node:0x007fdd3b87a760 @value=2, @following=#<LinkedList::Node:0x007fdd3b87a490 @value=3, @following=#<LinkedList::Node:0x007fdd3b87a1c0 @value=4, @following=nil>>>, #<LinkedList::Node:0x007fdd3b87a490 @value=3, @following=#<LinkedList::Node:0x007fdd3b87a1c0 @value=4, @following=nil>>
      end                                                         # => nil
        return @counter_2 - @counter_1                            # => 2
    end                                                           # => :find_distance_stepper

  end  # => :find_distance_stepper
end    # => :find_distance_stepper

@list = LinkedList::List.new()     # => #<LinkedList::List:0x007fdd3b87aeb8 @head=nil>
@node_1 = LinkedList::Node.new(1)  # => #<LinkedList::Node:0x007fdd3b87aa30 @value=1, @following=nil>
@node_2 = LinkedList::Node.new(2)  # => #<LinkedList::Node:0x007fdd3b87a760 @value=2, @following=nil>
@node_3 = LinkedList::Node.new(3)  # => #<LinkedList::Node:0x007fdd3b87a490 @value=3, @following=nil>
@node_4 = LinkedList::Node.new(4)  # => #<LinkedList::Node:0x007fdd3b87a1c0 @value=4, @following=nil>

@list.append(@node_1)  # => #<LinkedList::Node:0x007fdd3b87aa30 @value=1, @following=nil>
@list.append(@node_2)  # => #<LinkedList::Node:0x007fdd3b87a760 @value=2, @following=nil>
@list.append(@node_3)  # => #<LinkedList::Node:0x007fdd3b87a490 @value=3, @following=nil>
@list.append(@node_4)  # => #<LinkedList::Node:0x007fdd3b87a1c0 @value=4, @following=nil>

@list                                  # => #<LinkedList::List:0x007fdd3b87aeb8 @head=#<LinkedList::Node:0x007fdd3b87aa30 @value=1, @following=#<LinkedList::Node:0x007fdd3b87a760 @value=2, @following=#<LinkedList::Node:0x007fdd3b87a490 @value=3, @following=#<LinkedList::Node:0x007fdd3b87a1c0 @value=4, @following=nil>>>>>
@list.find_distance(@node_1, @node_3)  # => 2
