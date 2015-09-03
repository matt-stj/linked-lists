require_relative 'node'  # => true

module LinkedList
  class List

    attr_accessor :head  # => nil

    def initialize(head = nil)
      @head = head              # => nil
    end                         # => :initialize

    def stepper
    end          # => :stepper

    def append(node)
      if @head.nil?                                      # => true, false, false
        @head = node                                     # => #<LinkedList::Node:0x007fdd99942a68 @value=1, @following=nil>
      else
        current_position = @head                         # => #<LinkedList::Node:0x007fdd99942a68 @value=1, @following=nil>, #<LinkedList::Node:0x007fdd99942a68 @value=1, @following=#<LinkedList::Node:0x007fdd99942770 @value=2, @following=nil>>
        until current_position.tail?                     # => true, false, true
          current_position = current_position.following  # => #<LinkedList::Node:0x007fdd99942770 @value=2, @following=nil>
        end                                              # => nil, nil
        current_position.following = node                # => #<LinkedList::Node:0x007fdd99942770 @value=2, @following=nil>, #<LinkedList::Node:0x007fdd99942450 @value=3, @following=nil>
      end                                                # => #<LinkedList::Node:0x007fdd99942a68 @value=1, @following=nil>, #<LinkedList::Node:0x007fdd99942770 @value=2, @following=nil>, #<LinkedList::Node:0x007fdd99942450 @value=3, @following=nil>
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
      @counter = 0                                            # => 0
      if @head.nil? && location == 0                          # => false
        @head = node
      elsif location == 0                                     # => false
        node.following = @head
        @head = node
      else
        current_position = @head                              # => #<LinkedList::Node:0x007fdd99942a68 @value=1, @following=#<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=nil>>>
        until current_position.tail? || location == @counter  # => false, false, true
          @counter += 1                                       # => 1, 2
          current_position = current_position.following       # => #<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=nil>>, #<LinkedList::Node:0x007fdd99942450 @value=3, @following=nil>
        end                                                   # => nil
        node.following = current_position.following           # => nil
        current_position.following = node                     # => #<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>
      end                                                     # => #<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>
    end                                                       # => :insert

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
    end                                                    # => :includes?


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
    end                                                  # => :pop

    def count
      if @head.nil?                                      # => false, false
        return "The list is empty"
      else
        @counter = 1                                     # => 1, 1
        current_position = @head                         # => #<LinkedList::Node:0x007fdd99942a68 @value=1, @following=#<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=nil>>>, #<LinkedList::Node:0x007fdd99942a68 @value=1, @following=#<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>>>
        until current_position.tail?                     # => false, false, true, false, false, false, true
          @counter += 1                                  # => 2, 3, 2, 3, 4
          current_position = current_position.following  # => #<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=nil>>, #<LinkedList::Node:0x007fdd99942450 @value=3, @following=nil>, #<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>>, #<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>, #<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>
        end                                              # => nil, nil
      end
      @counter                                           # => 3, 4
    end                                                  # => :count

    def head_value
      if @head.nil?
        return "The list is empty"
      else
        @head.value
      end
    end                             # => :head_value

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
    end                                                  # => :tail_value

    def find_by_index(location)
      @counter = 0                                            # => 0
      if @head.nil? && location == 0                          # => false
        return "The list is empty"
      elsif location == 0                                     # => false
        @head.value
      else
        current_position = @head                              # => #<LinkedList::Node:0x007fdd99942a68 @value=1, @following=#<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>>>
        until current_position.tail? || location == @counter  # => false, true
          @counter += 1                                       # => 1
          current_position = current_position.following       # => #<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>>
        end                                                   # => nil
        if current_position.tail? && location != @counter     # => false
          return "location doesn't exist"
        else
        current_position.value                                # => 2
        end
      end
    end                                                       # => :find_by_index

    def find_by_value(value)
      @counter = 0                                                       # => 0
      if @head.nil?                                                      # => false
        return "The list is empty"
      else
        current_position = @head                                         # => #<LinkedList::Node:0x007fdd99942a68 @value=1, @following=#<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>>>
        until current_position.tail? || value == current_position.value  # => false, false, true
          @counter += 1                                                  # => 1, 2
          current_position = current_position.following                  # => #<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>>, #<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>
        end                                                              # => nil
        if current_position.tail? && current_position.value != value     # => false
          return "value doesn't exist"
        else
          return @counter                                                # => 2
        end
      end
    end                                                                  # => :find_by_value

    def remove_by_index(location)
      if @head.nil? && location == 0  # => false
        return "The list is empty"
      elsif location == 0             # => false
        @head = @head.following
      elsif

        previous_position = @head                                 # => #<LinkedList::Node:0x007fdd99942a68 @value=1, @following=#<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>>>
        current_position = @head.following                        # => #<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>>
        @counter = 0                                              # => 0
        location -= 1                                             # => 199
        until current_position.tail? || location == @counter      # => false, false, true
           previous_position = previous_position.following        # => #<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>>, #<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>
           current_position = current_position.following          # => #<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>, #<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>
           @counter += 1                                          # => 1, 2
        end                                                       # => nil
        if current_position.tail? && location != @counter         # => true
          return "location doesn't exist"                         # => "location doesn't exist"
        else
        previous_position.following = current_position.following
        current_position.following = nil
      end
      end
    end                                                           # => :remove_by_index

    def remove_by_value(value)
      if @head.nil?                                                      # => false
        return "The list is empty"
      elsif @head.value == value                                         # => false
        @head = @head.following
      else
        previous_position = @head                                        # => #<LinkedList::Node:0x007fdd99942a68 @value=1, @following=#<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>>>
        current_position = @head.following                               # => #<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>>
        @counter = 0                                                     # => 0
        until current_position.tail? || current_position.value == value  # => false, false, true
           previous_position = previous_position.following               # => #<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>>, #<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>
           current_position = current_position.following                 # => #<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>, #<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>
           @counter += 1                                                 # => 1, 2
        end                                                              # => nil
        if current_position.tail? && current_position.value != value     # => true
          return "value doesn't exist"                                   # => "value doesn't exist"
        else
        previous_position.following = current_position.following
        current_position.following = nil
        end
      end
    end                                                                  # => :remove_by_value

  end  # => :remove_by_value
end    # => :remove_by_value

@list = LinkedList::List.new()     # => #<LinkedList::List:0x007fdd99942f68 @head=nil>
@node_1 = LinkedList::Node.new(1)  # => #<LinkedList::Node:0x007fdd99942a68 @value=1, @following=nil>
@node_2 = LinkedList::Node.new(2)  # => #<LinkedList::Node:0x007fdd99942770 @value=2, @following=nil>
@node_3 = LinkedList::Node.new(3)  # => #<LinkedList::Node:0x007fdd99942450 @value=3, @following=nil>
@node_4 = LinkedList::Node.new(4)  # => #<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>
#
#
@list.append(@node_1)              # => #<LinkedList::Node:0x007fdd99942a68 @value=1, @following=nil>
@list.append(@node_2)              # => #<LinkedList::Node:0x007fdd99942770 @value=2, @following=nil>
@list.append(@node_3)              # => #<LinkedList::Node:0x007fdd99942450 @value=3, @following=nil>
@list.count                        # => 3
#
# @node_1.following
# @list.head.following.value
#
# @list.includes?(2)
# @list                     # => #<LinkedList::List:0x007fa9a983a3d8 @head=#<LinkedList::Node:0x007fa9a983a018 @value=1, @following=#<LinkedList::Node:0x007fa9a9839de8 @value=2, @following=#<LinkedList::Node:0x007fa9a9839bb8 @value=3, @following=nil>>>>
# @list.count               # => 3
@list.insert(@node_4, 2)           # => #<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>
@list                              # => #<LinkedList::List:0x007fdd99942f68 @head=#<LinkedList::Node:0x007fdd99942a68 @value=1, @following=#<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>>>, @counter=2>
@list.count                        # => 4
@list.find_by_index(1)             # => 2
@list.find_by_value(3)             # => 2
@list                              # => #<LinkedList::List:0x007fdd99942f68 @head=#<LinkedList::Node:0x007fdd99942a68 @value=1, @following=#<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>>>, @counter=2>
@list.remove_by_index(200)         # => "location doesn't exist"
@list                              # => #<LinkedList::List:0x007fdd99942f68 @head=#<LinkedList::Node:0x007fdd99942a68 @value=1, @following=#<LinkedList::Node:0x007fdd99942770 @value=2, @following=#<LinkedList::Node:0x007fdd99942450 @value=3, @following=#<LinkedList::Node:0x007fdd99942220 @value=4, @following=nil>>>>, @counter=2>
@list.remove_by_value(500)         # => "value doesn't exist"
