require 'minitest'
require_relative '../lib/list'
require_relative '../lib/node'

module LinkedList
  class ListTest < Minitest::Test

    def setup
      @list = LinkedList::List.new()
      @node_1 = LinkedList::Node.new(1)
      @node_2 = LinkedList::Node.new(2)
    end

    def test_the_head_is_nil_for_empty_list
     assert_equal nil, @list.head
    end

    def test_an_appended_node_can_become_the_head
     @list.append(@node_1)
     assert_equal @node_1, @list.head
    end

    def test_a_node_can_be_appended_to_a_list
      @list.append(@node_1)
      assert @node_1.tail?
      @list.append(@node_2)
      assert @node_2.tail?
      assert_equal @node_2, @node_1.following
    end
    

  end
end
