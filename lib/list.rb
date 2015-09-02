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
        until node.tail?
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

    def insert(node)
    end

  end
end

@list = LinkedList::List.new()
@node_1 = LinkedList::Node.new(1)
@node_2 = LinkedList::Node.new(2)
@node_3 = LinkedList::Node.new(3)


@list.append(@node_1)
@list.append(@node_2)

@node_1.following
@list.head

@list.inspect

@list.prepend(@node_3)
